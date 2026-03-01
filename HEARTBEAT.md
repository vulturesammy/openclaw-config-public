# HEARTBEAT.md - Periodic Tasks

## Her Session Başında (Otomatik) veya Günlük Heartbeat

### Total Recall v2 (The Atomic Domain Loop)
Ajanın (Clawy) rutin hafıza görevi:
1. **Analiz Et:** Dünün ve bugünün sohbet geçmişinde veya `memory/YYYY-MM-DD.md` loglarında yeni bir "Kalıcı Kural" veya "Proje Değişikliği" var mı?
2. **Ekle (Zorunlu Santral):** Eğer yepyeni bir alana (Örn: Finans) girilmişse, `write` aracıyla yeni bir dosya (`memory/@project_finans.md`) oluştur ve bu dosyanın yolunu `MEMORY.md` içindeki `ZORUNLU OKUMA DİZİNİ` başlığı altına ekle.
3. **Güncelle (Bütünsel Okuma):** Eğer mevcut bir kural (Örn: Antfarm kuralı) değiştiyse, asla `edit` ile kelime araması yapma. İlgili dosyayı (Örn: `memory/@project_openclaw.md`) `read` ile tamamen oku, hafızanda sentezle ve `write` ile **üzerine yaz (overwrite)**.
4. **ASLA:** `MEMORY.md` dosyasına uzun uzun kurallar yazma. O dosya sadece hangi dosyanın okutulacağını söyleyen bir Santraldir (Switchboard).

## Günlük (Sabah 08:00 TRT)

### Haber Özeti (SearXNG)
```bash
# AI + OpenClaw haberleri
curl -s "http://192.168.1.85:8089/search?q=OpenClaw+AI+agents&format=json&engines=general" | jq '.results[:5]'
```

## Haftalık (Pazartesi 09:00)

### Güvenlik Audit
```bash
openclaw security audit
```

---

## Status

- ✅ `MEMORY.md` (Zorunlu Santral / Switchboard - Token İsrafı Yok)
- ✅ `memory/@*.md` (Atomik Etki Alanları / Holistic Domain Files - Kural Çelişkisi ve Parçalanması Yok)
- ✅ `HEARTBEAT.md` (Sıfır riskli Bütünsel Üzerine Yazma Döngüsü)
- ✅ `memory_search` (Episodik hatıralar için hala aktif ve uyumlu)
- ⚠️ Haber özeti (anahtar kelimeler bekleniyor)
