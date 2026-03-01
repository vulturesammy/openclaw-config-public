# Antfarm Analiz Raporu

*Tarih: 2026-02-23*

## Kurulu Olduğu Yer

```
~/.openclaw/agents/
├── antfarm-medic
├── bug-fix_fixer
├── bug-fix_investigator
├── bug-fix_pr
├── bug-fix_setup
├── bug-fix_triager
├── bug-fix_verifier
├── feature-dev_developer
├── feature-dev_planner
├── feature-dev_reviewer
├── feature-dev_setup
├── feature-dev_tester
├── feature-dev_verifier
├── security-audit_fixer
├── security-audit_pr
├── security-audit_prioritizer
├── security-audit_scanner
├── security-audit_setup
├── security-audit_tester
└── security-audit_verifier
```

## Workflow Yapısı

### feature-dev (7 agent)
```
plan → setup → implement → verify → test → PR → review
```

### bug-fix (6 agent)
```
triage → investigate → setup → fix → verify → PR
```

### security-audit (7 agent)
```
scan → prioritize → setup → fix → verify → test → PR
```

## Nasıl Çalışıyor

1. **Ralph Loop** - Her agent fresh session ile başlar
2. **SQLite** - State tracking
3. **Cron** - Workflow polling
4. **YAML** - Workflow definition

## Self-Improving Mekanizması

- Her agentın çıktısı sonraki agenta geçer
- Başarısız adımlar retry eder
- Verifier developer'ın kodunu kontrol eder (kendi kendini değil)
- Context her seferinde clean gelir

## Güvenlik Notları

- Sadece official `snarktank/antfarm` reposundan kurulur
- Prompt injection review yapılır
- Plain YAML/Markdown - şeffaf

## Çalıştırma Komutları

```bash
antfarm workflow list
antfarm workflow run feature-dev "Add user authentication"
antfarm workflow status "OAuth"
antfarm dashboard
```

## Bizim İçin Uygunluk

| Kriter | Değerlendirme |
|--------|----------------|
| OpenClaw native | ✅ Evet |
| Self-loop | ✅ Evet |
| Kurulum kolaylığı | ✅ Tek komut |
| Güvenlik | ✅ İncelenmiş |

---

*Bu dosya Antfarm kurulumu yapmadan önce sistemi analiz etmek için oluşturuldu.*
