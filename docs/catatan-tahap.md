# Catatan Worksheet State Management & Architecture

## Tahap 1 - Local State vs Shared State

| State atau data | Lokasi/penggunaan di Course Explorer | Kategori | Alasan |
|---|---|---|---|
| Detail pada switch Home | `HomePage._showDetail` | Local | Hanya mengubah bagian HomePage. |
| Jumlah kirim feedback | `FeedbackForm._loading` | Local | Hanya mengatur tampilan form saat submit. |
| Hasil feedback | `FeedbackForm._result` | Local | Hanya ditampilkan kembali di form tersebut. |
| Tab navigasi terpilih | `ResponsiveShell._index` | Shared dalam shell | Dipakai untuk menyelaraskan NavigationBar/NavigationRail dan IndexedStack. |
| Favorite course | Aksi pada halaman daftar dan detail | Shared lintas screen (kebutuhan) | Nilainya perlu tetap sama saat dibaca atau diubah dari beberapa screen; implementasinya akan dikerjakan pada tahap berikutnya. |
| Preferensi tema | Pengaturan tampilan aplikasi | Shared lintas aplikasi (kebutuhan) | Jika dapat diubah pengguna, nilainya perlu memengaruhi semua screen. |

Pada eksperimen Tahap 1, counter dan switch menggunakan `setState()` di
`LocalStateDemoPage`. Keduanya adalah local state karena hanya diperlukan oleh
halaman demo tersebut.

## Tahap 2 - Masalah setState() Saat Aplikasi Membesar

Demo menyimpan satu `Set<String>` favorite dan mengubahnya dengan
`setState()` di `PropDrillingDemoPage`. Parent mengirim nilai yang sama melalui
constructor ke `_FavoriteSummary` dan `_CourseList`; `_CourseList` menghitung
status tiap baris dan mengirim callback toggle ke parent.

Bagian yang berulang atau mulai sulit diikuti:

- `favoriteCodes` harus ditambahkan sebagai field, parameter constructor, dan
  argumen saat membuat kedua child.
- Callback `onToggleFavorite` harus ikut diteruskan ke daftar dan dibungkus
  dengan kode course untuk setiap baris.
- Jika child baru juga membutuhkan favorite, parent perlu menambahkan lagi
  parameter dan wiring callback. Makin dalam hierarki widget, makin banyak
  lapisan yang hanya meneruskan nilai.

## Tahap 3 - Lifting State Up dan Single Source of Truth

Setelah state dipindah ke parent (`LiftingStateDemoPage`), kartu (`CourseCard`) dan kotak switch (`_FavoriteSwitch`) selalu konsisten karena hanya ada satu variabel `_isFavorite` sebagai *single source of truth*.

Child tidak menyimpan salinan state lokal; perubahan dikirim via callback (`onFavoriteTap` dan `onChanged`) ke method parent yang memanggil `setState()`.

Kekurangannya: parent tetap harus meneruskan data dan callback secara manual ke child melalui constructor.

