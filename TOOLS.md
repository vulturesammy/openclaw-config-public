# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## ⚡ WEB ERİŞİM AKIŞ DİYAGRAMI

```
URL GELDİĞİNDE:
│
├─ X.com/Twitter linki mi?
│   └─ EVET → FixTwitter API kullan
│       curl -s "https://api.fxtwitter.com/status/{tweet_id}"
│
├─ Genel web sayfası mı?
│   ├─ 1. web_fetch dene
│   ├─ 2. Başarısızsa → Scrapling (Python)
│   └─ 3. Son çare → curl
│
├─ Arama gerekiyor mu?
│   ├─ Haber/içerik → SearXNG (192.168.1.85:8089)
│   └─ Derin araştırma → Deep Research Pro skill
│
└─ Login gerektiren site mi?
    └─ Chrome extension bağlı mı kontrol et, değilse SORMA
```

---

## 🔧 ARAÇLAR VE KULLANIMLARI

### 1. FixTwitter (X.com için) ✅
**Ne zaman:** Her X.com/Twitter linki
**Nasıl:**
```bash
curl -s "https://api.fxtwitter.com/status/{tweet_id}" | jq '.tweet'
```
**Not:** Chrome'a GİTME! FixTwitter her zaman çalışır.

### 2. Scrapling (Python) ✅
**Ne zaman:** JavaScript-rendered sayfalar, web_fetch başarısız olduğunda
**Nasıl:**
```python
from scrapling import Fetcher
fetcher = Fetcher()
page = fetcher.fetch('https://example.com')
print(page.text)
```

### 3. SearXNG (Arama) ✅
**Ne zaman:** Web araması, haber arama
**Nasıl:**
```bash
curl -s "http://192.168.1.85:8089/search?q={query}&format=json&engines=general"
```

### 4. Deep Research Pro Skill ✅
**Ne zaman:** Kapsamlı araştırma, multi-source rapor
**Nasıl:** Skill'i oku ve workflow'u takip et

### 5. web_fetch
**Ne zaman:** Basit statik sayfalar
**Not:** X.com için çalışmaz, FixTwitter kullan

### 6. browser (chrome)
**Ne zaman:** Login gerektiren siteler
**Önemli:** Extension bağlı olmalı. Bağlı değilse SORMA, diğer araçları kullan.

---

## ❌ YAPMAMAN GEREKENLER

1. **X.com için Chrome deneme** → FixTwitter var
2. **Her başarısızlıkta kullanıcıya sor** → Yedek araçları dene
3. **Aynı hatayı tekrarla** → TOOLS.md'yi oku ve uygula

---

## 📱 Messaging

```bash
# Send message via Telegram
message action=send target=1391337940 message="Hello"
```

## 🔧 System

```bash
openclaw status
openclaw gateway status
```

---

### Cameras
- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH
- home-server → 192.168.1.100, user: admin

### TTS
- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod