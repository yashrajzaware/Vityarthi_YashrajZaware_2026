# OSS Capstone: Technical Audit of Python 3
**Student Name:** Yashraj Zaware  
**Registration Number:** 24BCE11157  
**Course:** Open Source Software (NGMC)  
**Institution:** VIT Bhopal University  

---

## 1. Project Overview
This repository contains my final Capstone Project for the Open Source Software course. The objective of this audit was to move beyond just using a tool and instead perform a deep dive into the "why" and "how" of a major FOSS project. 

I chose **Python** as my subject. Python isn't just a language; it’s a massive community-driven ecosystem that demonstrates the transition from a solo hobby project (by Guido van Rossum) to the backbone of modern AI and Web infrastructure. This audit covers its licensing under the PSF, its integration within the Linux kernel/user-space, and its ethical standing in the software world.

## 2. Audited Software Profile
* **Name:** Python 3
* **Category:** Programming Language / Runtime Environment
* **License:** Python Software Foundation (PSF) License (GPL-compatible)
* **Linux Role:** Essential system dependency (used by `dnf`, `apt`, and system scripts)

## 3. Repository Contents & Scripts
I have developed five shell scripts to demonstrate practical Linux administration and automation skills as required by the course units.

| File | Task | Core Concepts Used |
| :--- | :--- | :--- |
| `script1_system_identity.sh` | System Environment Report | Variables, Command Substitution, `lsb_release` |
| `script2_package_inspector.sh` | FOSS Package Verification | If-else logic, `dpkg` querying, Case statements |
| `script3_disk_auditor.sh` | Permission & Size Audit | For-loops, `awk` text processing, `du` utility |
| `script4_log_analyzer.sh` | System Log Monitoring | While-read loops, Input Redirection, Grep |
| `script5_manifesto_generator.sh` | OSS Philosophy Generator | Interactive `read`, File I/O, String concatenation |

## 4. Setup & Execution
To run these scripts on your Linux environment, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/oss-audit-24BCE11157.git](https://github.com/your-username/oss-audit-24BCE11157.git)
   cd oss-audit-24BCE11157
