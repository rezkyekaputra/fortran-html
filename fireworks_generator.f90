! ============================================================
! MEGA FESTIVAL FIREWORKS ENGINE — FORTRAN × DART SASS 💥🎆🌌
! Dibuat oleh: Cefneal & Imouto 🌸
! 8 Letupan Spektakuler, 384 Partikel Fisika, Sky Flash & Skyline!
! ============================================================
program mega_fireworks_engine
  implicit none

  integer :: unit_scss, unit_html
  integer :: b, p
  real :: angle, speed, x, y, gravity_drop
  real, parameter :: PI = 3.141592653589793

  ! 8 Jenis Kembang Api Festival Akbar
  character(len=25) :: burst_name(8)
  character(len=15) :: col_primary(8), col_secondary(8), col_glitter(8)
  real :: burst_x(8), burst_y(8), burst_delay(8), burst_dur(8)

  burst_name = [character(len=25) :: &
    "phoenix-gold",   "cyan-supernova", "sakura-hanabi",  "emerald-dragon", &
    "amethyst-dream", "solar-flare",    "diamond-willow", "cosmic-starlight"]

  col_primary   = [character(len=15) :: &
    "#fe8019", "#8ec07c", "#d3869b", "#b8bb26", &
    "#b16286", "#fb4934", "#ffffff", "#fabd2f"]

  col_secondary = [character(len=15) :: &
    "#fabd2f", "#83a598", "#fb4934", "#ebdbb2", &
    "#d3869b", "#fe8019", "#fabd2f", "#ffffff"]

  col_glitter   = [character(len=15) :: &
    "#ffffff", "#ebdbb2", "#ffffff", "#fabd2f", &
    "#ebdbb2", "#ffffff", "#8ec07c", "#fe8019"]

  ! Posisi horizontal (vw), ketinggian letup (vh), jeda waktu (s), durasi (s)
  burst_x     = [20.0, 78.0, 50.0, 15.0, 85.0, 35.0, 65.0, 48.0]
  burst_y     = [24.0, 20.0, 16.0, 38.0, 32.0, 28.0, 22.0, 35.0]
  burst_delay = [0.0,  1.1,  2.2,  3.3,  4.4,  5.2,  6.1,  7.0]
  burst_dur   = [4.2,  4.0,  4.5,  4.1,  4.3,  4.0,  4.8,  4.2]

  ! ------------------------------------------------------------
  ! 1. GENERATE SCSS FESTIVAL
  ! ------------------------------------------------------------
  open(newunit=unit_scss, file="/home/dongkrak/fortran-web/fireworks.scss", status="replace")

  write(unit_scss,'(A)') "/// ========================================================="
  write(unit_scss,'(A)') "/// MEGA FESTIVAL FIREWORKS ENGINE (FORTRAN × DART SASS) 💥🎆"
  write(unit_scss,'(A)') "/// 8 Shells · 384 Multi-Stage Particles · Zero JavaScript"
  write(unit_scss,'(A)') "/// ========================================================="
  write(unit_scss,'(A)') "@use 'sass:math';"
  write(unit_scss,'(A)') "@use 'sass:color';"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "* { margin: 0; padding: 0; box-sizing: border-box; }"
  write(unit_scss,'(A)') "body {"
  write(unit_scss,'(A)') "  background: #050608;"
  write(unit_scss,'(A)') "  min-height: 100vh;"
  write(unit_scss,'(A)') "  overflow: hidden;"
  write(unit_scss,'(A)') "  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, monospace;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".sky {"
  write(unit_scss,'(A)') "  position: relative;"
  write(unit_scss,'(A)') "  width: 100vw;"
  write(unit_scss,'(A)') "  height: 100vh;"
  write(unit_scss,'(A)') "  background: radial-gradient(ellipse at 50% 100%, #1a1d24 0%, #08090c 70%, #030405 100%);"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Bintang-bintang malam berkedip */"
  write(unit_scss,'(A)') ".stars {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 2px; height: 2px;"
  write(unit_scss,'(A)') "  border-radius: 50%;"
  write(unit_scss,'(A)') "  background: transparent;"
  write(unit_scss,'(A)') "  box-shadow:"
  write(unit_scss,'(A)') "    10vw 15vh #fff, 25vw 22vh rgba(255,255,255,0.7), 40vw 8vh #fff, 55vw 18vh rgba(255,255,255,0.8),"
  write(unit_scss,'(A)') "    70vw 12vh #fff, 85vw 25vh rgba(255,255,255,0.5), 18vw 45vh rgba(255,255,255,0.6), 92vw 38vh #fff,"
  write(unit_scss,'(A)') "    33vw 32vh rgba(255,255,255,0.7), 62vw 40vh #fff, 80vw 8vh rgba(255,255,255,0.9), 5vw 30vh #fff;"
  write(unit_scss,'(A)') "  animation: twinkle 3s ease-in-out infinite alternate;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "@keyframes twinkle { 0% { opacity: 0.3; } 100% { opacity: 0.9; } }"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Siluet Kota Metropolitan di Bawah */"
  write(unit_scss,'(A)') ".skyline {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  bottom: 0;"
  write(unit_scss,'(A)') "  left: 0;"
  write(unit_scss,'(A)') "  width: 100%;"
  write(unit_scss,'(A)') "  height: 65px;"
  write(unit_scss,'(A)') "  background: linear-gradient(180deg, transparent 0%, #030405 90%);"
  write(unit_scss,'(A)') "  border-top: 1px solid rgba(255,255,255,0.05);"
  write(unit_scss,'(A)') "  z-index: 5;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Header Festival */"
  write(unit_scss,'(A)') ".overlay {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  top: 1.8rem;"
  write(unit_scss,'(A)') "  left: 50%;"
  write(unit_scss,'(A)') "  transform: translateX(-50%);"
  write(unit_scss,'(A)') "  text-align: center;"
  write(unit_scss,'(A)') "  z-index: 50;"
  write(unit_scss,'(A)') "  pointer-events: none;"
  write(unit_scss,'(A)') "  color: #ebdbb2;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "h1 {"
  write(unit_scss,'(A)') "  font-size: 2.6rem;"
  write(unit_scss,'(A)') "  font-weight: 900;"
  write(unit_scss,'(A)') "  letter-spacing: -0.5px;"
  write(unit_scss,'(A)') "  background: linear-gradient(90deg, #fabd2f, #fe8019, #fb4934, #d3869b, #8ec07c);"
  write(unit_scss,'(A)') "  -webkit-background-clip: text;"
  write(unit_scss,'(A)') "  -webkit-text-fill-color: transparent;"
  write(unit_scss,'(A)') "  filter: drop-shadow(0 0 35px rgba(254, 128, 25, 0.7));"
  write(unit_scss,'(A)') "  animation: headerGlow 2.5s infinite alternate;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "@keyframes headerGlow {"
  write(unit_scss,'(A)') "  0% { filter: drop-shadow(0 0 20px rgba(254, 128, 25, 0.5)); }"
  write(unit_scss,'(A)') "  100% { filter: drop-shadow(0 0 45px rgba(211, 134, 155, 0.8)); }"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ".sub {"
  write(unit_scss,'(A)') "  font-size: 0.95rem;"
  write(unit_scss,'(A)') "  color: #d5c4a1;"
  write(unit_scss,'(A)') "  margin-top: 6px;"
  write(unit_scss,'(A)') "  font-weight: 500;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ".badge-live {"
  write(unit_scss,'(A)') "  display: inline-flex;"
  write(unit_scss,'(A)') "  align-items: center;"
  write(unit_scss,'(A)') "  gap: 8px;"
  write(unit_scss,'(A)') "  background: rgba(254, 128, 25, 0.15);"
  write(unit_scss,'(A)') "  border: 1px solid rgba(254, 128, 25, 0.4);"
  write(unit_scss,'(A)') "  padding: 4px 12px;"
  write(unit_scss,'(A)') "  border-radius: 999px;"
  write(unit_scss,'(A)') "  margin-top: 8px;"
  write(unit_scss,'(A)') "  font-size: 0.8rem;"
  write(unit_scss,'(A)') "  color: #fabd2f;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".firework {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 5px;"
  write(unit_scss,'(A)') "  height: 5px;"
  write(unit_scss,'(A)') "  border-radius: 50%;"
  write(unit_scss,'(A)') "}"

  ! Loop untuk 8 Kembang Api
  do b = 1, 8
    write(unit_scss,'(A,A,A)') ".fw-", trim(burst_name(b)), " {"
    write(unit_scss,'(A,F5.1,A)') "  left: ", burst_x(b), "vw;"
    write(unit_scss,'(A,F5.1,A)') "  top: ", burst_y(b), "vh;"
    write(unit_scss,'(A,A,A,F4.1,A,F4.1,A)') "  animation: burst-", trim(burst_name(b)), " ", &
      burst_dur(b), "s cubic-bezier(0.1, 0.8, 0.2, 1) infinite ", burst_delay(b), "s;"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""
    write(unit_scss,'(A,A,A)') "@keyframes burst-", trim(burst_name(b)), " {"

    ! 0%: Peluncuran roket dari bawah
    write(unit_scss,'(A)') "  0% {"
    write(unit_scss,'(A)') "    transform: translateY(92vh) scale(1);"
    write(unit_scss,'(A,A,A)') "    background: ", trim(col_primary(b)), ";"
    write(unit_scss,'(A,A,A)') "    box-shadow: 0 0 16px ", trim(col_secondary(b)), ";"
    write(unit_scss,'(A)') "    opacity: 1;"
    write(unit_scss,'(A)') "  }"

    ! 42%: Roket mencapai puncak ketinggian
    write(unit_scss,'(A)') "  42% {"
    write(unit_scss,'(A)') "    transform: translateY(0) scale(1.6);"
    write(unit_scss,'(A)') "    background: #ffffff;"
    write(unit_scss,'(A,A,A,A,A)') "    box-shadow: 0 0 35px #ffffff, 0 0 80px ", trim(col_primary(b)), ";"
    write(unit_scss,'(A)') "    opacity: 1;"
    write(unit_scss,'(A)') "  }"

    ! 44%: TITIK NOL DUAR! Flash ledakan pertama
    write(unit_scss,'(A)') "  44% {"
    write(unit_scss,'(A)') "    background: transparent;"
    write(unit_scss,'(A)') "    opacity: 1;"
    write(unit_scss,'(A)') "    box-shadow:"
    do p = 1, 48
      if (p < 48) then
        write(unit_scss,'(A,A,A)') "      0 0 3px #ffffff,"
      else
        write(unit_scss,'(A,A,A)') "      0 0 3px #ffffff;"
      end if
    end do
    write(unit_scss,'(A)') "  }"

    ! 70%: EKSPANSI MAKSIMAL 360 DERAJAT (Fisika Trigonometri Fortran!)
    write(unit_scss,'(A)') "  70% {"
    write(unit_scss,'(A)') "    background: transparent;"
    write(unit_scss,'(A)') "    opacity: 1;"
    write(unit_scss,'(A)') "    box-shadow:"
    do p = 1, 48
      angle = (real(p) / 48.0) * 2.0 * PI
      speed = 130.0 + mod(real(p) * 31.0, 85.0)  ! Variasi kecepatan partikel acak
      x = speed * cos(angle)
      y = speed * sin(angle)
      if (mod(p, 3) == 0) then
        if (p < 48) then
          write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 3px ", trim(col_primary(b)), ","
        else
          write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 3px ", trim(col_primary(b)), ";"
        end if
      else if (mod(p, 3) == 1) then
        if (p < 48) then
          write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 3px ", trim(col_secondary(b)), ","
        else
          write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 3px ", trim(col_secondary(b)), ";"
        end if
      else
        if (p < 48) then
          write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 2px ", trim(col_glitter(b)), ","
        else
          write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 2px ", trim(col_glitter(b)), ";"
        end if
      end if
    end do
    write(unit_scss,'(A)') "  }"

    ! 100%: EFEK GRAVITASI WILLOW FALL & FADE OUT
    write(unit_scss,'(A)') "  100% {"
    write(unit_scss,'(A)') "    background: transparent;"
    write(unit_scss,'(A)') "    opacity: 0;"
    write(unit_scss,'(A)') "    box-shadow:"
    do p = 1, 48
      angle = (real(p) / 48.0) * 2.0 * PI
      speed = 160.0 + mod(real(p) * 31.0, 85.0)
      gravity_drop = 95.0 + mod(real(p) * 17.0, 45.0)  ! Lengkungan gravitasi turun
      x = speed * cos(angle)
      y = speed * sin(angle) + gravity_drop
      if (p < 48) then
        write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 7px ", trim(col_secondary(b)), ","
      else
        write(unit_scss,'(A,F7.2,A,F7.2,A,A,A)') "      ", x, "px ", y, "px 7px ", trim(col_secondary(b)), ";"
      end if
    end do
    write(unit_scss,'(A)') "  }"

    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""
  end do

  close(unit_scss)
  print *, "File fireworks.scss (Mega Festival) sukses dibuat!"

  ! ------------------------------------------------------------
  ! 2. GENERATE INDEX.HTML MEGA FESTIVAL
  ! ------------------------------------------------------------
  open(newunit=unit_html, file="/home/dongkrak/fortran-web/index.html", status="replace")
  write(unit_html,'(A)') "<!DOCTYPE html>"
  write(unit_html,'(A)') "<html lang='id'>"
  write(unit_html,'(A)') "<head>"
  write(unit_html,'(A)') "  <meta charset='UTF-8'>"
  write(unit_html,'(A)') "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
  write(unit_html,'(A)') "  <title>FESTIVAL AKBAR KEMBANG API 🎆 · Fortran × Dart Sass</title>"
  write(unit_html,'(A)') "  <link rel='stylesheet' href='fireworks.css'>"
  write(unit_html,'(A)') "</head>"
  write(unit_html,'(A)') "<body>"
  write(unit_html,'(A)') "  <div class='overlay'>"
  write(unit_html,'(A)') "    <h1>✨ FESTIVAL KEMBANG API AKBAR 🎆</h1>"
  write(unit_html,'(A)') "    <p class='sub'>"
  write(unit_html,'(A)') "      8 Shells Simultant · 384 Partikel Fisika Gravitasi · 100% Pure GPU CSS"
  write(unit_html,'(A)') "    </p>"
  write(unit_html,'(A)') "    <div class='badge-live'>"
  write(unit_html,'(A)') "      <span>⚡ Trajektori: GNU Fortran 14.3.1</span>"
  write(unit_html,'(A)') "      <span>·</span>"
  write(unit_html,'(A)') "      <span>🎨 Transpiler: Dart Sass 1.107.1</span>"
  write(unit_html,'(A)') "    </div>"
  write(unit_html,'(A)') "  </div>"
  write(unit_html,'(A)') "  <div class='sky'>"
  write(unit_html,'(A)') "    <div class='stars'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-phoenix-gold'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-cyan-supernova'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-sakura-hanabi'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-emerald-dragon'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-amethyst-dream'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-solar-flare'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-diamond-willow'></div>"
  write(unit_html,'(A)') "    <div class='firework fw-cosmic-starlight'></div>"
  write(unit_html,'(A)') "    <div class='skyline'></div>"
  write(unit_html,'(A)') "  </div>"
  write(unit_html,'(A)') "</body>"
  write(unit_html,'(A)') "</html>"
  close(unit_html)
  print *, "File index.html (Mega Festival) sukses dibuat!"

end program mega_fireworks_engine
