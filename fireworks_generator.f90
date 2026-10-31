! ============================================================
! JAPANESE NISHIKI KAMURO HANABI (錦冠菊) ENGINE
! FORTRAN 14 × DART SASS 1.107
! Meniru visual persis foto kembangapijepang.jpg:
! - Golden Weeping Willow (Hujan Emas Menjuntai)
! - Jewel Neon Streamers (Hijau Zamrud, Magenta, Cyan, Oranye)
! - Central White-Hot Rocket Beam (Pilar Cahaya Putih Naik)
! - Japanese City & Bridge Silhouette dengan Lampu Berkelip
! ============================================================
program japanese_hanabi_engine
  implicit none

  integer :: unit_scss, unit_html
  integer :: i, k
  real :: angle, speed, r, tx, ty, drop_val
  real, parameter :: PI = 3.141592653589793

  character(len=15) :: jewel_cols(4)
  jewel_cols = [character(len=15) :: "#00ff88", "#ff007f", "#00d4ff", "#ff8800"]

  ! ------------------------------------------------------------
  ! 1. GENERATE SCSS
  ! ------------------------------------------------------------
  open(newunit=unit_scss, file="/home/dongkrak/fortran-web/fireworks.scss", status="replace")

  write(unit_scss,'(A)') "/// ====================================================="
  write(unit_scss,'(A)') "/// NISHIKI KAMURO HANABI (錦冠菊) · FORTRAN × DART SASS"
  write(unit_scss,'(A)') "/// Japanese Golden Willow & Jewel Streamers"
  write(unit_scss,'(A)') "/// ====================================================="
  write(unit_scss,'(A)') "@use 'sass:math';"
  write(unit_scss,'(A)') "@use 'sass:color';"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "* { margin: 0; padding: 0; box-sizing: border-box; }"
  write(unit_scss,'(A)') "body {"
  write(unit_scss,'(A)') "  background: radial-gradient(ellipse at 50% 60%, #06111f 0%, #02070f 60%, #010307 100%);"
  write(unit_scss,'(A)') "  min-height: 100vh;"
  write(unit_scss,'(A)') "  overflow: hidden;"
  write(unit_scss,'(A)') "  font-family: 'Hiragino Sans', 'Noto Sans JP', -apple-system, sans-serif;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".stage {"
  write(unit_scss,'(A)') "  position: relative;"
  write(unit_scss,'(A)') "  width: 100vw;"
  write(unit_scss,'(A)') "  height: 100vh;"
  write(unit_scss,'(A)') "  overflow: hidden;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Asap Langit & Cahaya Pendar Malam */"
  write(unit_scss,'(A)') ".ambient-glow {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  top: 15vh;"
  write(unit_scss,'(A)') "  left: 50%;"
  write(unit_scss,'(A)') "  transform: translateX(-50%);"
  write(unit_scss,'(A)') "  width: 90vw;"
  write(unit_scss,'(A)') "  height: 70vh;"
  write(unit_scss,'(A)') "  background: radial-gradient(circle, rgba(255, 200, 100, 0.12) 0%, rgba(0, 180, 216, 0.06) 45%, transparent 75%);"
  write(unit_scss,'(A)') "  filter: blur(40px);"
  write(unit_scss,'(A)') "  animation: ambientPulse 4s ease-in-out infinite alternate;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "@keyframes ambientPulse { 0% { opacity: 0.6; } 100% { opacity: 1; } }"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Title Overlay Estetik ala Matsuri Jepang */"
  write(unit_scss,'(A)') ".overlay {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  top: 1.5rem;"
  write(unit_scss,'(A)') "  left: 2rem;"
  write(unit_scss,'(A)') "  z-index: 100;"
  write(unit_scss,'(A)') "  color: #fff;"
  write(unit_scss,'(A)') "  text-shadow: 0 0 20px rgba(0,0,0,0.8);"
  write(unit_scss,'(A)') "  pointer-events: none;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "h1 {"
  write(unit_scss,'(A)') "  font-size: 2.2rem;"
  write(unit_scss,'(A)') "  font-weight: 800;"
  write(unit_scss,'(A)') "  letter-spacing: 2px;"
  write(unit_scss,'(A)') "  background: linear-gradient(90deg, #ffeaa7, #fdcb6e, #fab1a0, #74b9ff);"
  write(unit_scss,'(A)') "  -webkit-background-clip: text;"
  write(unit_scss,'(A)') "  -webkit-text-fill-color: transparent;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ".sub {"
  write(unit_scss,'(A)') "  font-size: 0.88rem;"
  write(unit_scss,'(A)') "  color: #dfe6e9;"
  write(unit_scss,'(A)') "  letter-spacing: 1px;"
  write(unit_scss,'(A)') "  margin-top: 4px;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Pilar Cahaya Vertikal Putih Panas di Tengah */"
  write(unit_scss,'(A)') ".central-pillar {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  bottom: 0;"
  write(unit_scss,'(A)') "  left: 50%;"
  write(unit_scss,'(A)') "  width: 4px;"
  write(unit_scss,'(A)') "  height: 85vh;"
  write(unit_scss,'(A)') "  transform: translateX(-50%);"
  write(unit_scss,'(A)') "  background: linear-gradient(180deg, #ffffff 0%, rgba(255, 235, 180, 0.9) 50%, transparent 100%);"
  write(unit_scss,'(A)') "  box-shadow: 0 0 20px 4px #ffffff, 0 0 45px 12px rgba(254, 202, 87, 0.7);"
  write(unit_scss,'(A)') "  animation: pillarBeam 3.8s ease-in-out infinite;"
  write(unit_scss,'(A)') "  z-index: 15;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "@keyframes pillarBeam {"
  write(unit_scss,'(A)') "  0%, 15% { opacity: 0; transform: translateX(-50%) scaleY(0); transform-origin: bottom; }"
  write(unit_scss,'(A)') "  25% { opacity: 1; transform: translateX(-50%) scaleY(1); transform-origin: bottom; }"
  write(unit_scss,'(A)') "  65% { opacity: 0.95; transform: translateX(-50%) scaleY(1); }"
  write(unit_scss,'(A)') "  90%, 100% { opacity: 0; transform: translateX(-50%) scaleY(1); }"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Pusat Ledakan Nishiki Kamuro */"
  write(unit_scss,'(A)') ".kamuro-center {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  top: 25vh;"
  write(unit_scss,'(A)') "  left: 50%;"
  write(unit_scss,'(A)') "  transform: translate(-50%, -50%);"
  write(unit_scss,'(A)') "  z-index: 20;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Partikel Golden Willow (Hujan Emas Melengkung Turun) */"
  write(unit_scss,'(A)') ".willow-spark {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 4px;"
  write(unit_scss,'(A)') "  height: 12px;"
  write(unit_scss,'(A)') "  border-radius: 999px;"
  write(unit_scss,'(A)') "  background: linear-gradient(180deg, #fff 0%, #fed330 60%, #fa8231 100%);"
  write(unit_scss,'(A)') "  box-shadow: 0 0 10px 2px rgba(254, 211, 48, 0.8), 0 0 20px 4px rgba(250, 130, 49, 0.5);"
  write(unit_scss,'(A)') "  transform-origin: center top;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Streamer Garis Lengkung Neon Khas Jepang */"
  write(unit_scss,'(A)') ".streamer {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 5px;"
  write(unit_scss,'(A)') "  height: 20px;"
  write(unit_scss,'(A)') "  border-radius: 999px;"
  write(unit_scss,'(A)') "  transform-origin: center top;"
  write(unit_scss,'(A)') "}"

  ! ------------------------------------------------------------
  ! LOOP GENERATE 72 PARTIKEL WILLOW EMAS (KAMURO) DENGAN FORTRAN
  ! ------------------------------------------------------------
  do i = 1, 72
    angle = (real(i) / 72.0) * 2.0 * PI
    speed = 140.0 + mod(real(i) * 37.0, 120.0) ! Kecepatan ledakan
    drop_val = 180.0 + mod(real(i) * 29.0, 100.0) ! Lengkungan gravitasi turun panjang khas willow Jepang

    tx = speed * cos(angle) * 1.6  ! Sebaran oval horizontal lebar
    ty = speed * sin(angle)

    write(unit_scss,'(A,I2.2,A)') ".w-", i, " {"
    write(unit_scss,'(A,I2.2,A)') "  animation: willow-anim-", i, " 3.8s cubic-bezier(0.12, 0.7, 0.2, 1) infinite;"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A,I2.2,A)') "@keyframes willow-anim-", i, " {"
    write(unit_scss,'(A)') "  0%, 22% { transform: translate3d(0, 0, 0) scale(0); opacity: 0; }"
    write(unit_scss,'(A)') "  26% { transform: translate3d(0, 0, 0) scale(1.5); opacity: 1; }"
    write(unit_scss,'(A,F7.2,A,F7.2,A)') "  52% { transform: translate3d(", tx, "px, ", ty, "px, 0) scale(1.2); opacity: 1; }"
    write(unit_scss,'(A,F7.2,A,F7.2,A)') "  100% { transform: translate3d(", (tx * 1.15), "px, ", (ty + drop_val), "px, 0) scale(0.3) scaleY(2.2); opacity: 0; }"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""
  end do

  ! ------------------------------------------------------------
  ! LOOP GENERATE 24 STREAMERS NEON WARNA-WARNI (JEWEL STREAKS)
  ! ------------------------------------------------------------
  do i = 1, 24
    angle = (real(i) / 24.0) * 2.0 * PI
    speed = 220.0 + mod(real(i) * 41.0, 110.0) ! Lebih cepat & jauh
    drop_val = 140.0

    tx = speed * cos(angle) * 1.5
    ty = speed * sin(angle) * 0.9

    k = mod(i, 4) + 1  ! Pilih 1 dari 4 warna neon (Hijau, Magenta, Cyan, Oranye)

    write(unit_scss,'(A,I2.2,A)') ".st-", i, " {"
    write(unit_scss,'(A,A,A)') "  background: ", trim(jewel_cols(k)), ";"
    write(unit_scss,'(A,A,A,A,A)') "  box-shadow: 0 0 16px 4px ", trim(jewel_cols(k)), ", 0 0 35px ", trim(jewel_cols(k)), ";"
    write(unit_scss,'(A,I2.2,A)') "  animation: streamer-anim-", i, " 3.8s cubic-bezier(0.15, 0.85, 0.35, 1) infinite;"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A,I2.2,A)') "@keyframes streamer-anim-", i, " {"
    write(unit_scss,'(A)') "  0%, 20% { transform: translate3d(0, 0, 0) scale(0); opacity: 0; }"
    write(unit_scss,'(A)') "  24% { transform: translate3d(0, 0, 0) scale(2); opacity: 1; }"
    write(unit_scss,'(A,F7.2,A,F7.2,A)') "  58% { transform: translate3d(", tx, "px, ", ty, "px, 0) scale(1) scaleY(2.5); opacity: 1; }"
    write(unit_scss,'(A,F7.2,A,F7.2,A)') "  95%, 100% { transform: translate3d(", (tx * 1.1), "px, ", (ty + drop_val), "px, 0) scale(0.1) scaleY(3); opacity: 0; }"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""
  end do

  ! ------------------------------------------------------------
  ! SILUET KOTA & JEMBATAN BUSUR JEPANG (TOYOTA STADIUM STYLE)
  ! ------------------------------------------------------------
  write(unit_scss,'(A)') "/* Lanskap Bawah: Jembatan Busur & Kota Jepang */"
  write(unit_scss,'(A)') ".japan-landscape {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  bottom: 0;"
  write(unit_scss,'(A)') "  left: 0;"
  write(unit_scss,'(A)') "  width: 100%;"
  write(unit_scss,'(A)') "  height: 28vh;"
  write(unit_scss,'(A)') "  background: linear-gradient(180deg, transparent 0%, rgba(3, 8, 16, 0.95) 45%, #010408 100%);"
  write(unit_scss,'(A)') "  z-index: 30;"
  write(unit_scss,'(A)') "  pointer-events: none;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".bridge-arch {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  bottom: 8vh;"
  write(unit_scss,'(A)') "  left: 28vw;"
  write(unit_scss,'(A)') "  width: 44vw;"
  write(unit_scss,'(A)') "  height: 9vh;"
  write(unit_scss,'(A)') "  border: 3px solid rgba(255, 120, 100, 0.7);"
  write(unit_scss,'(A)') "  border-bottom: none;"
  write(unit_scss,'(A)') "  border-radius: 999px 999px 0 0;"
  write(unit_scss,'(A)') "  box-shadow: 0 0 25px rgba(255, 100, 80, 0.5), inset 0 0 15px rgba(255, 100, 80, 0.3);"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".city-bokeh {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  bottom: 2vh;"
  write(unit_scss,'(A)') "  width: 100%;"
  write(unit_scss,'(A)') "  height: 12vh;"
  write(unit_scss,'(A)') "  box-shadow:"
  write(unit_scss,'(A)') "    5vw -2vh 6px 1px #00d2ff, 12vw -4vh 8px 2px #ff4757, 18vw -1vh 5px 1px #ffa502,"
  write(unit_scss,'(A)') "    26vw -3vh 6px 1px #2ed573, 34vw -5vh 10px 2px #fff, 48vw -2vh 6px 1px #1e90ff,"
  write(unit_scss,'(A)') "    60vw -4vh 7px 2px #eccc68, 72vw -2vh 8px 2px #ff6b81, 84vw -5vh 12px 3px #00f59b,"
  write(unit_scss,'(A)') "    92vw -3vh 6px 1px #ffa502, 40vw -1vh 5px 1px #70a1ff, 68vw -1vh 5px 1px #ff4757;"
  write(unit_scss,'(A)') "  opacity: 0.85;"
  write(unit_scss,'(A)') "}"

  close(unit_scss)
  print *, "SCSS Hanabi Jepang berhasil dibuat oleh Fortran!"

  ! ------------------------------------------------------------
  ! 2. GENERATE INDEX.HTML
  ! ------------------------------------------------------------
  open(newunit=unit_html, file="/home/dongkrak/fortran-web/index.html", status="replace")
  write(unit_html,'(A)') "<!DOCTYPE html>"
  write(unit_html,'(A)') "<html lang='ja'>"
  write(unit_html,'(A)') "<head>"
  write(unit_html,'(A)') "  <meta charset='UTF-8'>"
  write(unit_html,'(A)') "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
  write(unit_html,'(A)') "  <title>錦冠菊 · 日本の花火 (Nishiki Kamuro Hanabi) 🎆</title>"
  write(unit_html,'(A)') "  <link rel='stylesheet' href='fireworks.css?v=hanabi_v1'>"
  write(unit_html,'(A)') "</head>"
  write(unit_html,'(A)') "<body>"
  write(unit_html,'(A)') "  <div class='stage'>"
  write(unit_html,'(A)') "    <div class='ambient-glow'></div>"
  write(unit_html,'(A)') ""
  write(unit_html,'(A)') "    <div class='overlay'>"
  write(unit_html,'(A)') "      <h1>錦冠菊 · 日本の花火</h1>"
  write(unit_html,'(A)') "      <p class='sub'>JAPANESE NISHIKI KAMURO HANABI · GOLDEN WILLOW & NEON STREAMERS</p>"
  write(unit_html,'(A)') "      <p style='color: #fdcb6e; font-size: 0.75rem; margin-top: 4px;'>"
  write(unit_html,'(A)') "        Calculated by GNU Fortran 14.3.1 · Compiled by Dart Sass 1.107.1"
  write(unit_html,'(A)') "      </p>"
  write(unit_html,'(A)') "    </div>"
  write(unit_html,'(A)') ""
  write(unit_html,'(A)') "    <!-- Pilar Putih Menembus Langit -->"
  write(unit_html,'(A)') "    <div class='central-pillar'></div>"
  write(unit_html,'(A)') ""
  write(unit_html,'(A)') "    <!-- Inti Kembang Api Kamuro -->"
  write(unit_html,'(A)') "    <div class='kamuro-center'>"
  
  ! 72 Partikel Weeping Willow Emas
  do i = 1, 72
    write(unit_html,'(A,I2.2,A)') "      <div class='willow-spark w-", i, "'></div>"
  end do

  ! 24 Streamers Neon Mewah
  do i = 1, 24
    write(unit_html,'(A,I2.2,A)') "      <div class='streamer st-", i, "'></div>"
  end do

  write(unit_html,'(A)') "    </div>"
  write(unit_html,'(A)') ""
  write(unit_html,'(A)') "    <!-- Lanskap Kota Jepang & Jembatan Busur -->"
  write(unit_html,'(A)') "    <div class='japan-landscape'>"
  write(unit_html,'(A)') "      <div class='bridge-arch'></div>"
  write(unit_html,'(A)') "      <div class='city-bokeh'></div>"
  write(unit_html,'(A)') "    </div>"
  write(unit_html,'(A)') "  </div>"
  write(unit_html,'(A)') "</body>"
  write(unit_html,'(A)') "</html>"
  close(unit_html)
  print *, "index.html Hanabi Jepang berhasil dibuat!"

end program japanese_hanabi_engine
