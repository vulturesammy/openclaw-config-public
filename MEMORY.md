# 🧠 HAFIZA SANTRALİ (The Switchboard)

*DİKKAT (AJAN): Bu dosya kuralları İÇERMEZ! Bu dosya, hangi kuralı HANGİ DOSYADAN okuman gerektiğini gösteren bir İNDEKS'tir. İşlem yapmadan önce ilgili `@` dosyasını `read` aracıyla TAMAMEN okumak ZORUNDASIN.*

## 📂 ZORUNLU OKUMA DİZİNİ (Atomic Domains)

### 👤 Kullanıcı ve İletişim Tercihleri
- **Ne Zaman Okunmalı?** Oguzhan'ın tarzı, token kısıtlamaları veya nasıl davranman gerektiği hakkında şüpheye düştüğünde.
- **Komut:** `read memory/@pref_oguzhan.md`

### 🚀 Proje: OpenClaw Altyapısı
- **Ne Zaman Okunmalı?** OpenClaw kurulumu, Antfarm workflowları, memory mimarisi, QMD veya tarayıcı ayarlarıyla ilgili bir işlem yapmadan önce.
- **Komut:** `read memory/@project_openclaw.md`

## ⚙️ YENİ KURAL EKLEME VE HAFIZA DİSİPLİNİ (ALMA)
1. **Geçmişi Ara (Episodic):** Eski bir hatayı (Örn: "Geçen ay npm hatası almıştık") arıyorsan, doğrudan `memory_search "npm hatası"` kullan. (Olaylar `memory/YYYY-MM-DD.md` loglarındadır).
2. **Kural Güncelle (Semantic Overwrite):** Eğer mevcut bir kural (Örn: Token tasarrufu) veya proje detayı değiştiyse, ilgili `@` dosyasını tamamen `read` et, kendi bağlamında düzelt ve `write` aracıyla üzerine yazarak (Overwrite) güncelle. `edit` aracı kullanmak risklidir.
3. **Yeni Domain Yarat (ALMA Topolojisi):** Yepyeni bir konuya (Örn: Finans, AWS) geçilirse, `write` aracıyla yeni bir atomik dosya (Örn: `memory/@project_aws.md`) oluştur ve bu santral dosyasına (`MEMORY.md`) o dosyanın yolunu ve ne zaman okunması gerektiğini ekle.

---
*Mimari: Total Recall v2 (Atomic Domains & Mandatory Read)*