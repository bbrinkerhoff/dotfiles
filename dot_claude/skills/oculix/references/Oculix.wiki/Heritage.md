![Lineage](https://img.shields.io/badge/Lineage-2009→2026-blue?style=for-the-badge)
![Origin](https://img.shields.io/badge/Origin-MIT-red?style=for-the-badge&logo=academia)
![Stewardship](https://img.shields.io/badge/Stewardship-RaiMan%20→%20Julien%20Mer-purple?style=for-the-badge)
![License](https://img.shields.io/badge/license-MIT-lightgrey?style=for-the-badge)

> *"Sikuli in Huichol Indian is their word for a **God's Eye**, meaning the power to see and understand things unknown."*

OculiX is not a fresh project. It is the latest link in a **chain of stewardship** that started in a research lab at MIT in 2009 and has been carried forward, hand to hand, by people who believed software could see what humans see. This page exists to honor that lineage and to make sure the people who built the foundations of this project are not forgotten as the codebase moves forward.

---

## The chain of transmission at a glance

| Year | Milestone | Steward |
|------|-----------|---------|
| **2009** | Sikuli born as MIT research project | Tsung-Hsiang Chang & Tom Yeh |
| **2012** | MIT authors graduate, project at risk | — |
| **2012** | Project taken over, renamed **SikuliX** | Raimund Hocke (RaiMan) |
| **2015** | First publication on Maven Central | RaiMan |
| **2015** | Public **SikuliX 2 vision** announced | RaiMan |
| **2025** | Handover discussions begin | RaiMan & Julien Mer |
| **2026** | Active fork created as **OculiX** | Julien Mer |
| **2026** | SikuliX 2 vision being delivered | OculiX team |

---

## 2009 — Birth at MIT

Sikuli was started in 2009 as an open-source research project at the **User Interface Design Group at MIT**, by **Tsung-Hsiang Chang** and **Tom Yeh**. The name comes from the Huichol Indian language, where *Sikuli* refers to a **God's Eye** — a symbol representing the power to see and understand things unknown.

The original idea was simple but radical: instead of automating software through APIs, accessibility trees, or DOM inspection, what if you could just take a screenshot of a button and tell the computer to click it?

> **What you see is what you script — *WYSIWYS*.**

The project produced a working prototype, gained academic visibility, and established the core principles that survive in OculiX today: image-based identification, screen abstraction, region-based actions, and a scripting layer accessible to non-programmers.

---

## 2012 — The graduation gap

Tsung-Hsiang Chang graduated from MIT in 2012. Tom Yeh moved on to become head of the **Sikuli Lab** at the Department of Computer Science at the **University of Colorado**. Both authors left active development of the project at the level of `Sikuli-X-1.0rc3`, the last MIT-era release.

The project was, at this point, at risk of becoming abandonware — a fate that has befallen many promising research tools whose authors moved on to other things.

---

## 2012 — RaiMan takes over

In late 2012, **Raimund Hocke** (RaiMan) — a retired IT manager from Germany who had spent his career in IT management since the early 1970s, but who had never worked as a professional programmer — decided to take over the project.

He renamed it **SikuliX** to differentiate it from the MIT-era version, and committed to maintaining and evolving it as a personal project in his retirement.

In a 2015 interview with **Joe Colantonio** on the TestGuild Automation Podcast (episode 40), RaiMan said:

> *"I am 65 years old. I have retired from my business. That's why I have enough time for one of my hobbies. This is Sikuli. My business lifetime I have been in IT management. I know the IT business from the early 70s. But I never have been a programmer in my lifetime. Four years ago when I started with Sikuli, I'm now programming three years semi-professional."*

Over the next **fourteen years**, RaiMan single-handedly carried SikuliX through dozens of releases, multiple platform additions, OpenCV upgrades, scripting language support (Jython, JRuby, Java), and a global user base spanning testers, automation engineers, gamers, and accessibility researchers.

---

## 2015 — First publication on Maven Central

On **October 7, 2015**, RaiMan published **SikuliX 1.1.0** on Maven Central as `com.sikulix:sikulixapi:1.1.0`. This was the first time the project became installable through standard Java dependency management tooling, opening it up to a much broader population of developers.

---

## 2015 — The SikuliX 2 vision

Also in 2015, RaiMan publicly described a vision for **SikuliX 2** during his TestGuild interview. The four pillars of that vision were:

| Pillar | Description |
|--------|-------------|
| **Pure Java** | Get rid of the remaining C++ native code |
| **Better image handling** | Automatic optimization, cross-environment compatibility, recapture workflows |
| **Robot Framework integration** | Make it easier for testers using high-level DSLs |
| **Easier contribution** | Restructure the codebase to lower the barrier for outside contributors |

Development of SikuliX 2 officially started in October 2015. It progressed in parallel with the SikuliX 1.x line for several years but never reached a stable, distributed release.

---

## 2025–2026 — The handover to Julien Mer

In late 2025, RaiMan reached out to **Julien Mer** (`@julienmerconsulting`), a French QA architect with 20+ years of experience across defense, biotech, aerospace, and retail, and a long-time user of SikuliX in production environments.

After several exchanges, RaiMan formally designated Julien as his successor by creating the GitHub repository `RaiMan/SikuliX1-is-now_Oculix`, naming the project **OculiX** ("eyes" in Latin) and writing personally:

> *"From now on I am a normal contributor to Oculix."*

In early 2026, OculiX was created as an active fork under the GitHub organization `oculix-org`. Within weeks, the project accumulated:

- **511** modified files
- **123 728** insertions
- Native VNC support, SSH tunneling, Android ADB 12+ integration
- PaddleOCR and EasyOCR neural OCR engines
- A **5-platform CI/CD pipeline** (Windows, macOS x64/aarch64, Linux x64/ARM via QEMU)
- Publication on Maven Central under `io.github.oculix-org`

---

## 2026 — Realizing the SikuliX 2 vision

Eleven years after RaiMan first sketched the SikuliX 2 vision in his TestGuild interview, OculiX is now actively delivering it:

| 2015 vision | 2026 OculiX delivery |
|-------------|----------------------|
| **Pure Java** | TigerVNC GPL dependency being replaced by **Speculix**, a pure-Java MIT-licensed VNC client |
| **Smarter image handling** | New **`PatternValidator`** reuses the existing Finder pipeline to detect ambiguous matches and undersized captures |
| **Better Robot Framework integration** | **Hélio Guilherme** (RIDE / Robot Framework) joined `oculix-org` as a contributor |
| **Easier contribution** | A 7-phase IDE refactoring is in progress, replacing the legacy Swing structure with **FlatLaf** and the **DJ-Raven** component ecosystem |

> The SikuliX 2 RaiMan envisioned in 2015 is, in essence, the **OculiX 3** we are building in 2026.

---

## Acknowledgements

This project would not exist without the people who carried it forward, each in their own time and on their own terms.

- **Tsung-Hsiang Chang** and **Tom Yeh** — for inventing Sikuli at MIT and for choosing to release it as open source rather than locking it behind a paywall.
- **Raimund Hocke (RaiMan)** — for fourteen years of single-handed stewardship, for publishing SikuliX on Maven Central, for the SikuliX 2 vision, and for the generosity of formally passing the torch rather than letting the project quietly fade.
- **Hélio Guilherme** — for joining the project as a contributor and bringing the Robot Framework community into the OculiX ecosystem.
- **Joe Colantonio** — for documenting RaiMan's work in the TestGuild Automation Podcast back in 2015, and for keeping the SikuliX entry alive in TestGuild's tooling references over the years.
- **The OpenCV community** — whose Java bindings power the Finder pipeline that has been the heart of every version of Sikuli, SikuliX, and OculiX.

---

## Historical resources

These external resources document the history of the project. They are preserved here because some of them may eventually disappear from the open web.

- 🎙️ **TestGuild Automation Podcast, episode 40** (February 15, 2015) — *Raimund Hocke: Getting Started with Sikuli Image Based Testing* by Joe Colantonio. The most complete public interview of RaiMan about his motivation, his approach, and his vision for SikuliX 2. [Listen on TestGuild](https://testguild.com/podcast/40-raimund-hocke-getting-started-with-sikuli-image-based-testing/)

- 🌐 **SikuliX Weebly homepage** (snapshot frozen on June 10, 2016) — the original public homepage of SikuliX before the migration to `sikulix.com`. Contains the founding narrative, the Huichol etymology, and the announcement of SikuliX 2 development. [Archived at sikulix.weebly.com](https://sikulix.weebly.com/)

- 🎓 **Sikuli MIT research project** — the original academic publications by Tsung-Hsiang Chang and Tom Yeh from the User Interface Design Group at MIT (2009–2012)

- 🔄 **`RaiMan/SikuliX1-is-now_Oculix`** — the GitHub repository RaiMan created to formally announce the transition from SikuliX to OculiX and designate his successor

---

## A note on naming

OculiX comes from the Latin *oculi*, meaning **"eyes"**. The name was chosen to honor the Huichol *Sikuli* — God's Eye — while signaling that this is a new chapter, with new contributors, new architecture, and a new commitment to deliver what was promised more than a decade ago.

The **X** is preserved from SikuliX, marking the continuity of the lineage.

---

> ### 👁️ Sikuli was the eye that saw.
> ### 👀 OculiX is the eyes that see — and remember.