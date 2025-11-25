# fui
FNX UI Toolkit for Jaspr

## Setup

To ensure the components render correctly, you must include the stylesheet in your project. Add the following line to the `<head>` section of your `web/index.html`:

```html
<link rel="stylesheet" href="packages/fui/css/fui.css">
```

If you are planning to use layout components, it's also necessary to configure your `<body>` element as follows:

```html
<body class="w-full h-full relative">
```

## Git pre-commit hook

Pro tento repozitář je připraven Git pre-commit hook, který na každém commitu automaticky:
- spustí `dart format` a znovu přidá případné změny do commitu,
- spustí `dart fix --apply` a znovu přidá změny,
- provede statickou analýzu `dart analyze` (případné chyby commit zablokují),
- spustí testy `dart test` (případné chyby commit zablokují).

Hook je umístěn v kořeni repozitáře v souboru:
- `.githooks/pre-commit`

### Aktivace hooku
Spusťte jednorázově v kořeni repozitáře:

```bash
# Použij .githooks jako zdroj hooků
git config core.hooksPath .githooks

# Ujisti se, že je hook spustitelný
chmod +x .githooks/pre-commit
```

Následně se hook spustí při každém `git commit`.