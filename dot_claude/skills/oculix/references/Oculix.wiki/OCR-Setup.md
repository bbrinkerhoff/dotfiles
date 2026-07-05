![Setup](https://img.shields.io/badge/topic-setup%20%2B%20troubleshooting-blue?style=for-the-badge)
![Bundled](https://img.shields.io/badge/Tesseract-bundled%20via%20Legerix-brightgreen?style=for-the-badge)

> How OCR is set up in OculiX, and what to do when Tesseract fails to initialize.

For the **pluggable engine architecture** (PaddleOCR ↔ Tesseract, interfaces, class layout), see the [**OCR Engines**](OCR-Engines) page.

---

## How OCR works in OculiX

OculiX **bundles Tesseract** on all supported platforms via [**Legerix**](https://github.com/oculix-org/Legerix). You do **not** need to install Tesseract from a system package manager.

| Platform | What ships in the jar |
|---|---|
| Windows x86_64 | Tesseract via Legerix bundle (built-in, no system install) |
| Linux x86_64 | Tesseract via Legerix bundle (statically-linked legacy build since `5.5.0-8`) |
| macOS x86_64 / aarch64 | Tesseract via Legerix bundle |

Language models (tessdata) are downloaded on first launch into a local cache (`~/.cache/legerix/<version>/tessdata` on Linux/macOS, `%LOCALAPPDATA%\legerix\<version>\tessdata` on Windows) and reused thereafter. The default language set is `eng`, `fra`, `spa`, `chi_sim`, `hin`.

---

## Troubleshooting Tesseract init failures

### `undefined symbol: TessBaseAPIInitLangMod` / `TessBaseAPIGetPAGEText`

You are seeing **your system's** `libtesseract.so` being loaded instead of the bundle OculiX ships. The error symbol is one that does not exist in the system Tesseract version your distribution provides, but the OculiX bundle (Tesseract 5.5.0) expects it.

On Linux, this used to happen because of a `RUNPATH $ORIGIN` token getting eaten down to `RIGIN` by libtool in the Legerix build — the bundled `libtesseract.so` failed to resolve its own `libjpeg` dependency, the loader fell back to the system Tesseract, and you hit the symbol mismatch. Tracked as [#350](https://github.com/oculix-org/Oculix/issues/350).

**Fixed in:** Legerix `5.5.0-8`, shipped in **OculiX `3.0.5`+**. If you are on `3.0.4` or earlier, upgrading to `3.0.5` resolves it. Your system-installed Tesseract does not need to be removed or downgraded — once the bundled one loads correctly, the system one is never touched.

### `OCR: start: Tesseract library problems` (generic)

Almost always a packaging or extraction problem, not a missing dependency. Try in order:

1. **Reinstall OculiX.** The Tesseract binaries are extracted from the jar to a local cache on first launch. If extraction failed (filesystem permissions, missing temp dir, antivirus quarantine), the engine will not initialize.
2. **Check the Legerix cache directory exists and is readable** (`~/.cache/legerix/` on Linux/macOS, `%LOCALAPPDATA%\legerix\` on Windows).
3. **Open an issue** with the full error, your platform/version, and the output of `ls -la ~/.cache/legerix/` (or the Windows equivalent).

### macOS quarantine / Gatekeeper

On macOS, the first launch may fail silently if Gatekeeper has quarantined the extracted natives. Run:

```bash
xattr -dr com.apple.quarantine ~/.cache/legerix/
```

…and relaunch.

---

## Optional: PaddleOCR as primary engine

If you want PaddleOCR (better quality on dense screens, GPU-capable on supported hardware) **instead of** the bundled Tesseract, install the [`paddleocrserver-powered`](https://github.com/julienmerconsulting/paddleOCRServer-powered) Python sidecar:

```bash
pip install paddleocrserver-powered
paddleocrserver-powered     # serves http://127.0.0.1:5000
```

OculiX auto-detects the server at startup and prefers it over Tesseract when available. The fallback to Tesseract is transparent if the server is unreachable. See [**OCR Engines**](OCR-Engines) for the pluggable architecture details and the trade-offs.

---

## Configuring OCR programmatically

```java
import org.sikuli.script.OCR;

// Language(s) — accepts a "+"-separated list
OCR.globalOptions().language("fra+eng");

// PSM mode (Page Segmentation Mode) — see Tesseract docs
OCR.globalOptions().psm(7);  // 7 = single text line

// Text height hint for the optimize() upscale heuristic
OCR.globalOptions().textHeight(15);
```

These options apply globally and can also be cloned per-call via `OCR.globalOptions().clone().language(...)`.

---

*If your issue is not covered here, please open a [discussion](https://github.com/oculix-org/Oculix/discussions) or an [issue](https://github.com/oculix-org/Oculix/issues) — the page evolves with real reports.*
