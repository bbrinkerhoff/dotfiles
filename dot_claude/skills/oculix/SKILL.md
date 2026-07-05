---
name: oculix
description: Expert assistant for OculiX and SikuliX visual automation — image-based screen automation that works without DOM, accessibility APIs, or drivers. Use this skill whenever the user asks about OculiX, SikuliX, visual automation via screenshots/images, Screen/Region/Pattern/Match/Finder classes, find()/click()/type()/wait()/exists() screen operations, VNCScreen remote automation, ADBScreen Android automation, SSHTunnel, PaddleOCR or Tesseract OCR in automation, DPI-aware matching or HiDPI scaling issues, running headless scripts with -r, the oculix npm package or Operix language wrappers, Maven dependency com.sikulix:sikulixapi, or migrating from SikuliX1 to OculiX. If the user is automating any UI without a DOM — legacy apps, thick clients, mainframes, VNC remotes, Android devices — this skill applies even if they haven't named OculiX or SikuliX explicitly.
---

# OculiX / SikuliX Visual Automation

OculiX (v3.0.3) is the active MIT fork of SikuliX1 (archived March 2026). It automates any screen via image matching + OCR — no DOM, no accessibility API, no driver. Works on local screens, VNC remotes, and Android via ADB.

**Bundled docs** (shipped with this skill, no external clone needed): `references/Oculix.wiki/` (OculiX additions), `references/SikuliX1.wiki/` (core API), `references/oculix-docs.pdf`, `references/SikuliX.pdf` — all paths relative to this skill's own directory (`~/.claude/skills/oculix/`). Read them for deep dives on any topic.

---

## Maven / Gradle setup

```xml
<dependency>
    <groupId>com.sikulix</groupId>
    <artifactId>sikulixapi</artifactId>
    <version>3.0.3</version>
</dependency>
```

Requires **Java 17+**. (SikuliX1 required Java 8; OculiX raised the baseline.)

---

## Core API — `org.sikuli.script`

These classes are inherited from SikuliX and unchanged in OculiX.

| Class | Role |
|-------|------|
| `Screen` | Local screen; extends `Region` |
| `Region` | Rectangular area — all automation ops live here |
| `Pattern` | Image file + optional similarity threshold (0.0–1.0, default 0.7) |
| `Match` | Result of a find; has `x`, `y`, `w`, `h`, `getScore()` |
| `Finder` | Low-level image search; use `Region` in normal code |

### Key methods on `Region` / `Screen`

```java
// Finding
Match m = s.find("button.png");          // throws FindFailed if not found
Match m = s.findAny("btn1.png", "btn2.png"); // first match wins
Iterator<Match> all = s.findAll("item.png"); // all occurrences
Match m = s.exists("button.png");        // null if not found — use for conditionals
Match m = s.wait("dialog.png", 10);      // waits up to 10 seconds
s.waitVanish("spinner.png", 30);         // waits for image to disappear

// Interacting
s.click("button.png");
s.doubleClick("icon.png");
s.rightClick("item.png");
s.hover("menu.png");
s.type("field.png", "hello world");      // clicks field, then types
s.paste("field.png", "hello world");     // faster than type(), bypasses keystroke events
s.type(Key.ENTER);                       // special keys via Key.*

// Regions
Region r = new Region(x, y, w, h);
Region r = s.find("anchor.png").right(200); // relative regions
```

### Pattern with similarity threshold

```java
Pattern p = new Pattern("button.png").similar(0.85); // require 85% match
s.click(p);
```

---

## OculiX additions

### VNC remote automation

Automate any machine running a VNC server with the same `find()`/`click()` API:

```java
import org.sikuli.vnc.VNCScreen;

VNCScreen vnc = VNCScreen.start("192.168.1.100", 5900, 10, 1000);
vnc.find("login_button.png").click();
vnc.type("username_field.png", "admin");
vnc.wait("dashboard.png", 15);
vnc.stop();
```

See `references/Oculix.wiki/VNC-Full-Stack.md` for multi-session, encodings, and thread-safety details.

### SSH tunnel (VNC or ADB over SSH)

The `SSHTunnel` class (backed by embedded JSch — no external binary) is a generic TCP port forwarder. It implements `Closeable` so try-with-resources auto-closes it:

```java
import com.sikulix.util.SSHTunnel;

// VNC over SSH
try (SSHTunnel tunnel = SSHTunnel.open("192.168.1.100", "user", "password")) {
    VNCScreen vnc = VNCScreen.start("127.0.0.1", tunnel.getLocalPort(), 10, 1000);
    vnc.find("button.png").click();
    vnc.stop();
}

// Key-based auth
SSHTunnel tunnel = SSHTunnel.open("host", "user", null, "/path/to/key.pem");

// Bastion/jump-host (bastion forwards to internal VNC host)
try (SSHTunnel tunnel = SSHTunnel.open("bastion", "user", "pass",
                                        5900, "internal-host", 5900)) {
    VNCScreen vnc = VNCScreen.start("127.0.0.1", tunnel.getLocalPort(), 10, 1000);
    vnc.stop();
}
```

See `references/Oculix.wiki/SSH-Tunnel.md` for advanced options (legacy server compat, SUSE 12, auto-reconnect).

### Android / ADB automation

Production-ready as of OculiX 3.0.x (was experimental in SikuliX1; broke on Android 12+).

```java
import org.sikuli.android.ADBScreen;

ADBScreen adb = new ADBScreen();           // connects to first adb device
adb.find("button.png").click();
adb.type("search_field.png", "query");
adb.wait("result.png", 10);
```

No external `adb` binary needed — JADB is vendored in the JAR. Supports Android 12+ WiFi ADB pairing. See `references/Oculix.wiki/Android-ADB.md`.

### OCR — PaddleOCR + Tesseract

OculiX auto-detects which engine is available. PaddleOCR is tried first; Tesseract is the fallback.

```java
// OCR is used automatically by text-based find methods
String text = s.text();                    // OCR the whole screen
String text = s.find("label_area.png").text(); // OCR a matched region
```

See `references/Oculix.wiki/OCR-Engines.md` and `references/Oculix.wiki/OCR-Setup.md` for server setup.

### DPI-aware matching (5-mode cascade)

OculiX automatically handles Windows display scaling changes (e.g., 100% → 150%). Images captured at one DPI scale will still match at another. No code change needed — it's built into `Finder2.doFindImage()`.

The cascade runs in order, stopping at the first success:
1. Exact `matchTemplate` (original threshold)
2. DPI-aware resize (reads DPI from PNG `pHYs` metadata)
3. GaussianBlur tolerant (threshold × 0.90)
4. Grayscale smart (threshold × 0.85)
5. Multi-scale brute-force — 7 ratios: 1.25×, 1.5×, 1.75×, 2.0×, 0.8×, 0.67×, 0.5×

Every PNG saved by OculiX has the system DPI embedded as `pHYs` metadata, so Mode 2 works out of the box. Legacy SikuliX templates without `pHYs` fall through to Modes 3–5.

> **SikuliX1 users**: this feature did not exist in SikuliX1. If your templates fail to match after a scaling change, you are likely on an older version.

See `references/Oculix.wiki/DPI-Aware-Matching-Pipeline.md` for the scoring fix and implementation details.

---

## Headless mode (`-r`)

Run a Jython script without the IDE GUI:

```bash
java -jar oculixide-3.0.3-complete-win.jar -r myscript.py
java -jar oculixide-3.0.3-complete-mac.jar -r myscript.py
java -jar oculixide-3.0.3-complete-linux.jar -r myscript.py
```

> **SikuliX1 users**: `-r` mode was broken in SikuliX1 (OpenCV failed to load, IDE tried to show a GUI). This is fully fixed in OculiX.

See `references/Oculix.wiki/Headless-Mode.md`.

---

## Language wrappers (Operix)

### Jython — in the OculiX IDE

Global functions mirror the Java API directly (no imports needed):

```python
click("login_button.png")
type("login_field.png", "admin")
wait("dashboard_logo.png", 10)
exists("error_dialog.png")
```

### Node.js / TypeScript (Operix wrapper)

```bash
npm install oculix
```

```javascript
const { Screen, App, VNCScreen } = require('oculix');

const screen = await Screen.create();
await screen.click('login.png');
await screen.type('admin');
await screen.wait('dashboard.png', 10);
```

Auto-downloads JVM bridge JAR to `~/.oculix/lib/` on first run. No `node-java` dependency.

### Python / .NET (Operix — in progress)

Same JSON-RPC-over-stdio architecture. See [`oculix-org/Operix`](https://github.com/oculix-org/Operix).

---

## OculiX vs SikuliX1 — quick reference

| Area | SikuliX1 | OculiX 3.0.3 |
|------|----------|--------------|
| Java version | 8+ | **17+** |
| OpenCV | openpnp 4.5.4 (JNI) | Apertix 4.10.0 (JNA) |
| VNC | Basic / unstable | Full TigerVNC vendored |
| Android | Experimental, broken on 12+ | Production, Android 12+ |
| OCR | Tesseract only | PaddleOCR + Tesseract |
| DPI/HiDPI | None | 5-mode cascade |
| Headless `-r` | Broken | Fixed |
| SSH tunnel | None | Embedded JSch |
| Status | Archived March 2026 | Active |

---

## Package map (for imports)

```
org.sikuli.script       — Screen, Region, Finder, Image, Pattern, Match
org.sikuli.support      — Commons, FileManager, RunTime
org.sikuli.android      — ADBDevice, ADBScreen, ADBRobot, ADBClient
org.sikuli.vnc          — VNCScreen, VNCRobot, XKeySym
org.sikuli.basics       — Settings, Debug, PreferencesUser
com.sikulix.vnc         — VNCClient, VNCFrameBuffer, VNCClipboard
com.sikulix.ocr         — OCREngine, PaddleOCREngine, TesseractEngine,
                          AmountVariantGenerator, TextNormalizer
com.sikulix.util        — SSHTunnel, SikuliLogger
```

---

## Answering questions accurately

- Default to OculiX 3.0.3 behavior unless the user specifies SikuliX1.
- When a feature was broken in SikuliX1 and fixed in OculiX (headless, DPI, Android 12+), say so explicitly — the user may be hitting a known SikuliX1 bug.
- For deep dives on any topic, read the relevant doc from this skill's `references/` directory before answering.
- For Node.js questions, use the `oculix` npm package (Operix), not direct JVM bindings.
- Include the Maven dependency snippet when answering Java setup questions.
- Match depth to the question: a basic API question gets a focused code snippet + brief explanation, not exhaustive coverage of every option. Save similarity tuning, DPI notes, and graceful fallbacks for when the context clearly calls for them.
