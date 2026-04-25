# Products App

## Rövid projektleírás

Ez egy Flutter alapú termékkatalógus alkalmazás, ahol a felhasználó böngészhet termékeket, kereshet közöttük, valamint kedvencekhez adhatja őket.

A termékek egy remote API-ból érkeznek, a kedvencek pedig lokálisan (SharedPreferences) kerülnek tárolásra.

---

## Futtatási lépések

1. Függőségek telepítése:
```bash
flutter pub get
```

2. Készülék/Emulator csatlakoztatása

3. App futtatása:
```bash
flutter run
```

## Architektúra

A projekt Clean Architecture elveket követ, három fő réteggel:

Data layer:
- API kommunikáció (Dio)
- Local storage (SharedPreferences)
- Repository implementáció

Domain layer:
- Use case-ek (pl. toggle favorite)
- Business modellek
- Repository interface-ek

Presentation layer:
- BLoC state management
- UI réteg (Flutter widgetek)

Miért ezt az architektúrát?
- Jól skálázható nagyobb projektekhez.
- Könnyen tesztelhető.
- Jól szeparálja a felelősségeket.
- Könnyen cserélhető adatforrás (API / local)

Miért Bloc állapotkezelés?

- Az event/state alapú logika bár kicsit több kód és valamikor boilerplate de sokkal jobban követhető.
- Könnyű tesztelni.
- Könnyen lehet kezelni a konkurens event-eket meg a hibákat.


## Ismert hiányosságok

- Nincs offline cache a terméklistára.
- A thumbnail network url-t sem cachelem el.

## További fejlesztések (+2 óra esetén)

- Kijavítanám az ismert hiányosságokat.
- Pull-to-refresh.
- Loading skeleton UI.
- UI téma kezelés finomhangolása.
- Jobb favorite kezelés,
- Unit + bloc tesztek bővítése.
- Lokalizáció.
- Nem a shared preferences könyvtárat használnám.