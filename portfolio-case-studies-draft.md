# Portfolio Case Studies — Draft Copy

*Fill in bracketed placeholders with exact specifics before publishing. These are first-pass drafts based on what's been discussed — dates, metrics, and names need verifying.*

---

## Advantech Robotics Internship — Autonomous Mobile Robot (Nagoya, 2025)

**Problem**
Advantech needed a working AMR demonstrator capable of autonomous navigation for trade show floors — a platform that could reliably move through unpredictable, crowded environments while showcasing Advantech's edge hardware in a live setting. [Add: what specific gap this filled — was it a new product line, a hardware showcase, a proof-of-concept for a client?]

**Approach**
- Built out the robot's navigation stack using ROS2, Nav2, and SLAM Toolbox for mapping and path planning
- [Add: what hardware base — custom chassis, off-the-shelf base platform, sensor suite (LIDAR, depth camera, etc.)]
- [Add: what Advantech edge compute hardware was integrated — this is likely central to why it mattered to them]
- Iterated through simulation before hardware deployment [if true — confirm whether Isaac Sim was used here specifically or came later with Aveline]
- [Add: any specific technical obstacle you solved — sensor calibration issue, localization drift, network/latency problem on the show floor, etc. This is the most valuable part of a case study — hiring managers want to see the debugging story, not just the stack list]

**Outcome**
- Demonstrated live at [trade show name(s), city, date] running autonomous navigation in front of attendees
- [Add: any measurable result — uptime across the show, number of demo runs, positive client/visitor feedback, whether it led to further work]

**Include on the page:**
- Photo or short video clip of the AMR at the trade show (this is your strongest social proof — prioritize getting this if you don't already have it saved)
- A simple stack diagram: sensors → SLAM/localization → Nav2 planner → motor control
- One or two sentences on what you'd do differently now, with your current Isaac Sim experience — shows growth, not just a static achievement

---

## Skills / Stack Section — Sim-to-Real Robotics Toolchain

Rather than a bare list, frame this as evidence of full-pipeline capability:

**Simulation & Planning**
- Isaac Sim — robot modeling, URDF authoring (including rigging conversion from Blender for the Aveline project), physics simulation
- ROS2 — node architecture, topic/service design
- Nav2 — path planning and autonomous navigation stacks
- SLAM Toolbox — mapping and localization

**Hardware Reality**
- Diagnosed and resolved an Isaac Sim 5.1.0 driver regression on an RTX 2080 workstation, including configuring WebRTC streaming over Tailscale for remote sim access
- [Add: any other hardware/driver troubleshooting worth naming — GPU comparisons for LLM inference could also live here if you want to tie robotics + AI infra together]

**Framing line for the page:**
"I don't just run simulations — I've had to fix the environments that run them: driver regressions, remote streaming setups, and the gap between what works in sim and what survives contact with real sensors and real floors."

---

## Home AI Inference Server

**What it is**
A self-hosted inference stack running on a home server (AMD Ryzen 7950X, 128GB RAM, AMD 7900 XTX) on Arch Linux — built to explore local LLM hosting without cloud dependency.

**Stack**
- ROCm for AMD GPU acceleration + Ollama for model serving
- Docker Compose for service orchestration
- n8n for workflow automation on top of the models
- Tailscale for secure remote access
- Grafana for monitoring
- Qdrant for vector storage
- Piper for local TTS

**The interesting part**
- Explored multi-backend llama.cpp limitations when mixing AMD and NVIDIA hardware — worth a short writeup, since GPU-vendor interoperability in local LLM setups is a real pain point people search for
- Diagnosed and recovered from an Arch Linux boot failure (stale fstab entry) via live USB chroot — a good "I can operate at the systems level, not just the application level" anecdote

**Include on the page:**
- A simple architecture diagram (services boxed, arrows showing data flow — this alone will do more than the text)
- Note that this reflects your broader pattern: "I prefer building interconnected systems over isolated scripts" — ties directly into the Gressingham and NorwichVR infra work, giving the portfolio a consistent thread

---

## Gressingham Foods Automation Toolkit (Sanitized Case Study)

**Framing note:** since this is employer work, keep specifics generic (no proprietary data, internal tool names can stay if not sensitive, avoid exact volumes/figures unless you've confirmed they're fine to share).

**Problem**
A food production environment with legacy tooling (tkinter-based internal apps) and manual, error-prone compliance processes — including UK Extended Producer Responsibility (EPR) packaging classification and shelf-life data management — running on locked-down hardware with no cloud access.

**Approach — lead with the OCR pipeline, it's the strongest technical story**
- Built and deployed a fully local, CPU-only LLM-based OCR pipeline using llama.cpp, running on locked-down hardware with no GPU and no external network access
- [Add: what documents it processes and why OCR was needed — calibration certificates? Supplier paperwork? This is the "problem" the pipeline solves and matters for the case study]
- [Add: how you validated accuracy / what the fallback was for low-confidence extractions]
- Migrated legacy tkinter tooling to Flask, [add: why — maintainability? multi-user access? web deployment across sites?]
- Automated shelf-life data merging, PDF classification, and Outlook-based reminders for compliance deadlines

**Outcome**
- [Add: time saved, error reduction, or adoption — even an estimate like "cut manual document processing from X hours to Y" is far more compelling than a feature list]
- Deep involvement in FoodOps/QualityApp administration, including writing conditional expressions and debugging live data sources

**Include on the page:**
- No screenshots of proprietary interfaces unless cleared — instead, a generic architecture diagram: documents in → local LLM OCR → structured data out → compliance system
- One sentence on the constraint that makes this notable: getting an LLM pipeline running entirely offline on locked-down hardware is a genuinely uncommon skill to demonstrate

---

## NorwichVR — Arduino Projects
*[Placeholder — need details from you: what did you build, what problem did it solve, what was the outcome/deployment context?]*
