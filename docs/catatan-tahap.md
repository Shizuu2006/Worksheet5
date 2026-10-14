# Catatan Worksheet State Management & Architecture

## Tahap 1 — Local State vs Shared State

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
