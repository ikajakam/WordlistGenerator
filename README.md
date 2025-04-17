# 🛠️ Wordlist Generator from Live Website + Wayback URLs

A Bash script to generate a custom wordlist for a target domain by combining words scraped from the live site using **CeWL** and historical URLs fetched from the **Wayback Machine** using **waybackurls**.

This is useful for **directory brute-forcing**, **parameter fuzzing**, or general **reconnaissance**.


## 📦 Features

- ✅ Scrapes visible text from the target site using CeWL  
- ✅ Extracts keywords from archived URLs using waybackurls  
- ✅ Cleans and merges wordlists  
- ✅ Outputs a unique, sorted wordlist ready for use  

---

## 🧰 Prerequisites

Make sure the following tools are installed and accessible:

- [`cewl`](https://github.com/digininja/CeWL)
- [`waybackurls`](https://github.com/tomnomnom/waybackurls)

Install using:

```bash
sudo gem install cewl
go install github.com/tomnomnom/waybackurls@latest
```
### ✅ Usage

```bash
chmod +x wordlistgenerator.sh
./wordlistgenerator.sh https://example.com
```

