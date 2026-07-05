<div align="center">

### **Visual automation for the real world — JVM, MIT, no commercial pitch**

*OculiX looks at the screen the way a human does. No DOM, no accessibility API, no driver dependency.*

<br>

![OculiX](https://img.shields.io/badge/OculiX-3.0.3-1f883d?style=for-the-badge)
![OpenCV](https://img.shields.io/badge/OpenCV-4.10.0-5C3EE8?style=for-the-badge&logo=opencv)
![Java](https://img.shields.io/badge/Java-17+-ED8B00?style=for-the-badge&logo=openjdk)
![PaddleOCR](https://img.shields.io/badge/PaddleOCR-bundled-0085CA?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-lightgrey?style=for-the-badge)
![Air-gap](https://img.shields.io/badge/air--gap-ready-555?style=for-the-badge)

<br>

![Locales](https://img.shields.io/badge/22-native--reviewed%20locales-3178C6?style=flat-square)
![Sectors](https://img.shields.io/badge/5%2B-regulated%20sectors-8b5cf6?style=flat-square)
![Contributors](https://img.shields.io/badge/12%2B-active%20contributors-f59e0b?style=flat-square)
![Lineage](https://img.shields.io/badge/MIT_→_MIT-23%20years-d4a500?style=flat-square)
![Heritage](https://img.shields.io/badge/Fork%20of-SikuliX1-1f883d?style=flat-square)

</div>

---

OculiX is the active fork of [SikuliX1](https://github.com/RaiMan/SikuliX1) (archived March 2026) — picking up 23 years of MIT-origin visual automation and bringing it to production-grade JVM tooling for regulated, legacy, and cross-platform environments where DOM-based tools cannot reach.

---

## 🎯 Why OculiX

Most modern automation tools (Selenium, Appium, Playwright) need a DOM, an accessibility API, or a vendor driver. That covers maybe 60% of real software. **OculiX covers the rest.**

| 🏦 **Banking & Finance** | 🖥️ **Mainframes** | 🏪 **Retail POS** | 📱 **Android fleets** | 🔀 **Hybrid flows** |
|:---:|:---:|:---:|:---:|:---:|
| SAP, Oracle EBS, legacy thick clients | IBM 5250 / 3270 terminals | VNC over SSH, distant fleets | Android 12+ via ADB, no proprietary cloud | Selenium handles the browser, OculiX the native dialogs |

Visual matching + OCR + VNC + ADB, all from the **same JVM library**. Free, MIT, no telemetry, no per-seat licence.

---

## ⚡ 30-second example

<details open>
<summary><b>☕ Java (native)</b></summary>

**Maven dependency**:
```xml
<dependency>
    <groupId>com.sikulix</groupId>
    <artifactId>sikulixapi</artifactId>
    <version>3.0.3</version>
</dependency>
```

**Drive any screen**:
```java
Screen s = new Screen();
s.click("login_button.png");
s.type("login_field.png", "admin");
s.wait("dashboard_logo.png", 10);
```

Same code runs on Windows, macOS, Linux, and over VNC to remote machines.

</details>

<details>
<summary><b>🐍 Jython (in the OculiX IDE, no install)</b></summary>

Open the OculiX IDE, paste, hit Run :

```python
click("login_button.png")
type("login_field.png", "admin")
wait("dashboard_logo.png", 10)
```

Identical primitives as the Java API, exposed as global functions in the IDE's Jython runtime.

</details>

<details>
<summary><b>🟢 Node.js / TypeScript via Operix</b></summary>

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

The [`oculix` npm package](https://github.com/oculix-org/Operix/tree/main/nodejs) auto-downloads the OculiX JVM bridge JAR on first use into `~/.oculix/lib/`. Zero `node-java` dependency.

</details>

<details>
<summary><b>🐍 Python via Operix</b> (in progress)</summary>

The Python wrapper follows the same architecture as the Node.js one — JSON-RPC over stdio to a tiny JVM bridge. See [`oculix-org/Operix`](https://github.com/oculix-org/Operix) for the current state.

</details>

<details>
<summary><b>🔵 .NET via Operix</b> (in progress)</summary>

The .NET wrapper is published in the same family. See [`oculix-org/Operix`](https://github.com/oculix-org/Operix).

</details>

---

## 📊 What's different from SikuliX1

| Area | SikuliX1 | OculiX |
|------|----------|--------|
| **OpenCV** | openpnp 4.5.4 (JNI) | [Apertix](https://github.com/oculix-org/Apertix) 4.10.0 (JNA) |
| **Java baseline** | 8+ | 17+ |
| **VNC** | Basic / broken | Full stack with TigerVNC + SSH tunnel |
| **SSH** | None | Embedded JSch tunnel for ADB / VNC |
| **Android** | Experimental | Production-ready (12+) |
| **OCR** | Tesseract only | PaddleOCR + Tesseract (pluggable, [bundled server](https://github.com/julienmerconsulting/paddleOCRServer-powered)) |
| **DPI / Retina** | None | 5-mode cascade matching pipeline |
| **Headless (`-r`)** | Broken in many cases | Fixed, tested, CI-enforced |
| **CI** | Travis CI, Java 11 | GitHub Actions, Java 17, multi-platform |
| **Recorder** | Legacy (NPE-prone) | Modern Recorder (beta), AI-assisted |
| **i18n** | Partial | 22 locales, native-reviewed via community |

> For SikuliX **core API documentation** (Region, Screen, Pattern, Match, OCR…), see [sikulix.github.io](https://sikulix.github.io). This wiki documents **what OculiX adds or changes**.

---

## 🪶 Free, MIT, no commercial pitch

OculiX stays open-source MIT by design. The companion article [*"23 ans après le MIT, l'automatisation visuelle n'a plus besoin d'être commerciale"*](https://shiftopsolutions.com/blog-shift-op/posts-blog-sos/23-ans-aprs-le-mit-lautomatisation-visuelle-na-plus-besoin-dtre-commerciale) (in English: *"23 years after MIT, visual automation no longer needs to be commercial"*) lays out the position. Concretely:

- 📦 **Bundled, not licensed** — OpenCV 4.10 (via Apertix), Tesseract, JSch, VNC, ADB. One jar, nothing else.
- 🚫 **No agent**, no port to open, no cloud telemetry. **Air-gap-ready by default.**
- ⚖️ **MIT licence** — relevant for AI Act compliance, defense, biotech, healthcare, banking deployments.
- 🤝 **No commercial fork**, no enterprise tier with paywalled features. The platform is one and the same for everyone.

---

## 🧩 Ecosystem

OculiX is the JVM core. Around it, a small family of focused projects:

<table>
<tr>
<td valign="top" width="50%">

**[Operix](https://github.com/oculix-org/Operix)**  
*Language wrappers* — Node.js, Python, .NET that bridge to the OculiX JVM core via a tiny JSON-RPC server. Same primitives, idiomatic API in each language.

</td>
<td valign="top" width="50%">

**[Apertix](https://github.com/oculix-org/Apertix)**  
*OpenCV JVM fork* — adds Apple Silicon (`aarch64`) support, used by OculiX directly. Replaces the legacy openpnp JNI bindings.

</td>
</tr>
<tr>
<td valign="top">

**[paddleocr-server](https://github.com/julienmerconsulting/paddleOCRServer-powered)**  
*Multi-language OCR HTTP server* — bundled when PaddleOCR is preferred over Tesseract. Self-contained PyPi install.

</td>
<td valign="top">

**MCP server** *(in this repo, `MCP/` module)*  
JSON-RPC over stdio / Streamable HTTP for QA frameworks (Robot Framework, pytest, Playwright) that prefer a thinner wire than legacy XML-RPC.

</td>
</tr>
</table>

---

## 🗺️ Wiki Navigation

<table>
<tr>
<td valign="top" width="50%">

### 🚀 Getting Started

- [[Build from Source]] — compile and run from source
- [[Architecture Overview]] — module layout (`API` / `IDE` / `MCP`)

### 🔄 What Changed

- [[Differences from SikuliX]] — full comparison table
- [[Changelog]] — releases, PRs, contributors

### ✨ Features

- [[VNC Full Stack]] — remote desktop automation
- [[SSH Tunnel]] — ADB / VNC over SSH
- [[Android ADB]] — mobile automation (Android 12+)
- [[OCR Engines]] — PaddleOCR + Tesseract
- [[DPI-Aware Matching Pipeline]] — 5-mode cascade for HiDPI
- [[Headless Mode]] — running scripts via `-r`

</td>
<td valign="top" width="50%">

### 🏗️ Infrastructure

- [[OpenCV Migration]] — openpnp JNI → Apertix JNA
- [[CI CD Infrastructure]] — GitHub Actions, multi-OS
- [[IDE Modernization]] — Modern Recorder, theme foundation

### 📜 About

- [[Heritage]] — MIT CSAIL 2003 → UIST 2009 → Raimund Hocke 2010–2023 → oculix-org March 2026

</td>
</tr>
</table>

---

## 🤝 Community

OculiX is community-driven and welcomes contributions of all sizes — bug reports, native i18n review, fork-and-fix PRs, design discussions.

**Active maintainers and contributors include**:

- [@RaiMan](https://github.com/RaiMan) — SikuliX1 creator, active on architecture discussions (issues [#291](https://github.com/oculix-org/Oculix/issues/291), [#277](https://github.com/oculix-org/Oculix/issues/277)…) and native reviewer for the German bundle
- [@julienmerconsulting](https://github.com/julienmerconsulting) — current maintainer, OculiX direction
- **Native i18n reviewers** : [@issaojr](https://github.com/issaojr) (pt_BR), [@tcc](https://github.com/tcc) (zh_TW), [@peixuana](https://github.com/peixuana) (zh_CN), [@yash-biswakarma](https://github.com/yash-biswakarma) (hi), [@yunosan007](https://github.com/yunosan007) (ja)
- **Bug hunters & fixers** : [@micves](https://github.com/micves), [@adriancostin6](https://github.com/adriancostin6), [@robserm](https://github.com/robserm), [@nishantsir57](https://github.com/nishantsir57), [@roboraptor](https://github.com/roboraptor)

**Where to discuss**:

- [GitHub Issues](https://github.com/oculix-org/Oculix/issues) — bugs, feature requests, design
- [Discussions](https://github.com/oculix-org/Oculix/discussions) — questions, ideas, show & tell
- See [[Heritage]] for the full lineage and acknowledgements

---

## 🌐 External resources

<table>
<tr>
<td valign="top" width="50%">

- 📖 **Public docs site** — [docs.oculix.org](https://docs.oculix.org)
- 📰 **Articles** — [shiftopsolutions.com — OculiX series](https://shiftopsolutions.com)
- 📬 **Newsletter** — [La Guilde](https://laguilde.substack.com) by Jean-François Fresi (French QA community)

</td>
<td valign="top" width="50%">

- 🏷️ **Releases** — [GitHub Releases](https://github.com/oculix-org/Oculix/releases)
- 🛒 **Maven Central** — `com.sikulix:sikulixapi:3.0.3`
- ⭐ **Star us** — [github.com/oculix-org/Oculix](https://github.com/oculix-org/Oculix)

</td>
</tr>
</table>

<div align="center">

<sub>OculiX is MIT-licensed and developed in the open by the <a href="https://github.com/oculix-org">oculix-org</a> community.</sub>

</div>
