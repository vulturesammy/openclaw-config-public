# PROJE: OpenClaw Temel Kurulum ve Mimari
- **Durum:** Aktif
- **Odak:** "Total Recall v2" - Atomik Etki Alanı ve Zorunlu Okuma (Atomic Domains & Mandatory Read) Mimarisi.

## Kurulu Bileşenler (Altyapı)
1. **Hafıza:** QMD kapalı. Basit dosya tabanlı memory (MEMORY.md + @ dosyaları).
2. **Model:** Bailian/Alibaba API - glm-5 (default), qwen3-coder-plus, kimi-k2.5
3. **Ağ Erişimi:** X.com için FixTwitter API, genel siteler için Scrapling/web_fetch

## Web Erişim Araçları
| Araç | Kullanım | Durum |
|------|----------|-------|
| FixTwitter | X.com tweet'leri | ✅ Aktif |
| Scrapling | JS-rendered sayfalar | ✅ Aktif |
| SearXNG | Web araması (192.168.1.85:8089) | ✅ Aktif |
| web_fetch | Basit statik sayfalar | ✅ Aktif |
| browser (chrome) | Login gerektiren siteler | ⚠️ Extension gerektirir |

## Hafıza Mimari Kuralları (Total Recall v2)
- **Olaylar (Episodic):** Günlük `memory/YYYY-MM-DD.md` dosyalarına sadece APPEND (ekleme) yapılır.
- **Kurallar (Semantic/State):** Kurallar ve projeler `@` işaretiyle başlayan atomik dosyalarda tutulur. Bu dosyalar bütünsel (holistic) olarak `read` aracıyla okunur. Değişiklik gerekirse `write` ile baştan aşağı ezilerek (Overwrite) güncellenir.
- **Santral:** MEMORY.md sadece bir İNDEKS'tir, kuralları içermez.

## Kaldırılan Bileşenler
- **Antfarm:** 2026-03-01'de kaldırıldı. Verimsiz bulundu.
- **QMD Memory:** Binary eksik olduğu için kapatıldı.