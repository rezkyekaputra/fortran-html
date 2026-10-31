! ============================================================
! ULTIMATE MEGA FIREWORKS ENGINE — FORTRAN × DART SASS 💥🎆
! Arsitektur: Multi-Particle DOM + Hardware GPU Transform3D
! Menjamin 100% animasi berjalan mulus, super terang & meriah!
! ============================================================
program ultimate_fireworks
  implicit none

  integer :: unit_scss, unit_html
  integer :: s, p, num_shells, num_particles
  real :: angle, speed, tx, ty, drop_val
  real, parameter :: PI = 3.141592653589793

  character(len=20) :: shell_name(6)
  character(len=15) :: col_main(6), col_glow(6)
  real :: shell_x(6), shell_y(6), shell_delay(6)

  num_shells = 6
  num_particles = 24  ! 24 partikel per letupan × 6 letupan = 144 partikel simultan

  shell_name = [character(len=20) :: &
    "phoenix", "supernova", "sakura", "emerald", "amethyst", "starlight"]

  col_main = [character(len=15) :: &
    "#fe8019", "#8ec07c", "#d3869b", "#b8bb26", "#b16286", "#ffffff"]

  col_glow = [character(len=15) :: &
    "#fabd2f", "#83a598", "#fb4934", "#fabd2f", "#d3869b", "#fabd2f"]

  ! Posisi letupan di langit (vw horizontal, vh vertikal) & delay waktu
  shell_x     = [22.0, 78.0, 50.0, 32.0, 68.0, 50.0]
  shell_y     = [28.0, 24.0, 20.0, 36.0, 32.0, 42.0]
  shell_delay = [0.0,  0.8,  1.6,  2.4,  3.2,  4.0]

  ! ------------------------------------------------------------
  ! 1. GENERATE SCSS DENGAN DART SASS
  ! ------------------------------------------------------------
  open(newunit=unit_scss, file="/home/dongkrak/fortran-web/fireworks.scss", status="replace")

  write(unit_scss,'(A)') "/// ====================================================="
  write(unit_scss,'(A)') "/// ULTIMATE FIREWORKS ENGINE (FORTRAN × DART SASS) 💥🎆"
  write(unit_scss,'(A)') "/// Hardware-Accelerated CSS · Instant Launch · No Lag"
  write(unit_scss,'(A)') "/// ====================================================="
  write(unit_scss,'(A)') "@use 'sass:math';"
  write(unit_scss,'(A)') "@use 'sass:color';"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "* { margin: 0; padding: 0; box-sizing: border-box; }"
  write(unit_scss,'(A)') "body {"
  write(unit_scss,'(A)') "  background: #020305;"
  write(unit_scss,'(A)') "  min-height: 100vh;"
  write(unit_scss,'(A)') "  overflow: hidden;"
  write(unit_scss,'(A)') "  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, monospace;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".sky {"
  write(unit_scss,'(A)') "  position: relative;"
  write(unit_scss,'(A)') "  width: 100vw;"
  write(unit_scss,'(A)') "  height: 100vh;"
  write(unit_scss,'(A)') "  background: radial-gradient(ellipse at 50% 100%, #171b24 0%, #06080c 60%, #020305 100%);"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".stars {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 2px; height: 2px;"
  write(unit_scss,'(A)') "  border-radius: 50%;"
  write(unit_scss,'(A)') "  background: transparent;"
  write(unit_scss,'(A)') "  box-shadow:"
  write(unit_scss,'(A)') "    12vw 14vh #fff, 28vw 20vh rgba(255,255,255,0.7), 42vw 8vh #fff, 60vw 16vh rgba(255,255,255,0.8),"
  write(unit_scss,'(A)') "    75vw 12vh #fff, 88vw 22vh rgba(255,255,255,0.6), 15vw 42vh rgba(255,255,255,0.5), 94vw 35vh #fff,"
  write(unit_scss,'(A)') "    35vw 30vh rgba(255,255,255,0.7), 65vw 38vh #fff, 82vw 6vh rgba(255,255,255,0.9), 8vw 28vh #fff;"
  write(unit_scss,'(A)') "  animation: twinkle 2.5s ease-in-out infinite alternate;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "@keyframes twinkle { 0% { opacity: 0.3; } 100% { opacity: 0.95; } }"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".skyline {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  bottom: 0;"
  write(unit_scss,'(A)') "  left: 0;"
  write(unit_scss,'(A)') "  width: 100%;"
  write(unit_scss,'(A)') "  height: 60px;"
  write(unit_scss,'(A)') "  background: linear-gradient(180deg, transparent 0%, rgba(5,6,8,0.95) 100%);"
  write(unit_scss,'(A)') "  border-top: 1px solid rgba(255,255,255,0.06);"
  write(unit_scss,'(A)') "  z-index: 10;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".overlay {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  top: 1.8rem;"
  write(unit_scss,'(A)') "  left: 50%;"
  write(unit_scss,'(A)') "  transform: translateX(-50%);"
  write(unit_scss,'(A)') "  text-align: center;"
  write(unit_scss,'(A)') "  z-index: 100;"
  write(unit_scss,'(A)') "  pointer-events: none;"
  write(unit_scss,'(A)') "  color: #ebdbb2;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') "h1 {"
  write(unit_scss,'(A)') "  font-size: 2.5rem;"
  write(unit_scss,'(A)') "  font-weight: 900;"
  write(unit_scss,'(A)') "  background: linear-gradient(90deg, #fabd2f, #fe8019, #fb4934, #d3869b, #8ec07c);"
  write(unit_scss,'(A)') "  -webkit-background-clip: text;"
  write(unit_scss,'(A)') "  -webkit-text-fill-color: transparent;"
  write(unit_scss,'(A)') "  filter: drop-shadow(0 0 35px rgba(254, 128, 25, 0.7));"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ".sub {"
  write(unit_scss,'(A)') "  font-size: 0.95rem;"
  write(unit_scss,'(A)') "  color: #d5c4a1;"
  write(unit_scss,'(A)') "  margin-top: 6px;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ".tag {"
  write(unit_scss,'(A)') "  display: inline-block;"
  write(unit_scss,'(A)') "  background: rgba(254, 128, 25, 0.18);"
  write(unit_scss,'(A)') "  border: 1px solid rgba(254, 128, 25, 0.45);"
  write(unit_scss,'(A)') "  color: #fabd2f;"
  write(unit_scss,'(A)') "  font-size: 0.8rem;"
  write(unit_scss,'(A)') "  padding: 4px 14px;"
  write(unit_scss,'(A)') "  border-radius: 999px;"
  write(unit_scss,'(A)') "  margin-top: 8px;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Shell Container */"
  write(unit_scss,'(A)') ".shell {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 0;"
  write(unit_scss,'(A)') "  height: 0;"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Kepala Roket Meluncur */"
  write(unit_scss,'(A)') ".rocket {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 6px;"
  write(unit_scss,'(A)') "  height: 6px;"
  write(unit_scss,'(A)') "  border-radius: 50%;"
  write(unit_scss,'(A)') "  transform: translate(-50%, -50%);"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Kilatan Ledakan Utama (Flash) */"
  write(unit_scss,'(A)') ".flash {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 16px;"
  write(unit_scss,'(A)') "  height: 16px;"
  write(unit_scss,'(A)') "  border-radius: 50%;"
  write(unit_scss,'(A)') "  transform: translate(-50%, -50%);"
  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "/* Partikel Kembang Api */"
  write(unit_scss,'(A)') ".particle {"
  write(unit_scss,'(A)') "  position: absolute;"
  write(unit_scss,'(A)') "  width: 6px;"
  write(unit_scss,'(A)') "  height: 6px;"
  write(unit_scss,'(A)') "  border-radius: 50%;"
  write(unit_scss,'(A)') "  transform: translate(-50%, -50%);"
  write(unit_scss,'(A)') "}"

  ! Loop untuk tiap Shell Kembang Api
  do s = 1, num_shells
    write(unit_scss,'(A,A,A)') ".shell-", trim(shell_name(s)), " {"
    write(unit_scss,'(A,F5.1,A)') "  left: ", shell_x(s), "vw;"
    write(unit_scss,'(A,F5.1,A)') "  top: ", shell_y(s), "vh;"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""

    ! Animasi Roket Meluncur Naik
    write(unit_scss,'(A,A,A)') ".shell-", trim(shell_name(s)), " .rocket {"
    write(unit_scss,'(A,A,A)') "  background: ", trim(col_main(s)), ";"
    write(unit_scss,'(A,A,A)') "  box-shadow: 0 0 16px 4px ", trim(col_glow(s)), ";"
    write(unit_scss,'(A,A,A,F4.1,A)') "  animation: rocket-", trim(shell_name(s)), " 3.2s ease-out infinite ", shell_delay(s), "s;"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""
    write(unit_scss,'(A,A,A)') "@keyframes rocket-", trim(shell_name(s)), " {"
    write(unit_scss,'(A)') "  0% { transform: translateY(75vh) scale(1); opacity: 1; }"
    write(unit_scss,'(A)') "  38% { transform: translateY(0) scale(1.8); opacity: 1; }"
    write(unit_scss,'(A)') "  40% { opacity: 0; }"
    write(unit_scss,'(A)') "  100% { opacity: 0; }"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""

    ! Animasi Kilatan Ledakan (Flash)
    write(unit_scss,'(A,A,A)') ".shell-", trim(shell_name(s)), " .flash {"
    write(unit_scss,'(A)') "  background: #ffffff;"
    write(unit_scss,'(A,A,A,A,A)') "  box-shadow: 0 0 45px 15px #ffffff, 0 0 90px 30px ", trim(col_main(s)), ";"
    write(unit_scss,'(A,A,A,F4.1,A)') "  animation: flash-", trim(shell_name(s)), " 3.2s ease-out infinite ", shell_delay(s), "s;"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""
    write(unit_scss,'(A,A,A)') "@keyframes flash-", trim(shell_name(s)), " {"
    write(unit_scss,'(A)') "  0%, 37% { transform: scale(0); opacity: 0; }"
    write(unit_scss,'(A)') "  39% { transform: scale(3.5); opacity: 1; }"
    write(unit_scss,'(A)') "  48% { transform: scale(6); opacity: 0; }"
    write(unit_scss,'(A)') "  100% { opacity: 0; }"
    write(unit_scss,'(A)') "}"
    write(unit_scss,'(A)') ""

    ! Loop 24 Partikel per Shell (Fisika Trigonometri Fortran!)
    do p = 1, num_particles
      angle = (real(p) / real(num_particles)) * 2.0 * PI
      speed = 110.0 + mod(real(p) * 27.0, 95.0)  ! Variasi kecepatan partikel acak
      drop_val = 70.0 + mod(real(p) * 19.0, 45.0) ! Lengkungan gravitasi bumi

      tx = speed * cos(angle)
      ty = speed * sin(angle)

      write(unit_scss,'(A,A,A,I2.2,A)') ".shell-", trim(shell_name(s)), " .p-", p, " {"
      if (mod(p, 2) == 0) then
        write(unit_scss,'(A,A,A)') "  background: ", trim(col_main(s)), ";"
        write(unit_scss,'(A,A,A)') "  box-shadow: 0 0 14px 2px ", trim(col_glow(s)), ";"
      else
        write(unit_scss,'(A,A,A)') "  background: ", trim(col_glow(s)), ";"
        write(unit_scss,'(A,A,A)') "  box-shadow: 0 0 14px 2px ", trim(col_main(s)), ";"
      end if
      write(unit_scss,'(A,A,A,I2.2,A,F4.1,A)') "  animation: anim-", trim(shell_name(s)), "-p", p, &
        " 3.2s cubic-bezier(0.12, 0.8, 0.25, 1) infinite ", shell_delay(s), "s;"
      write(unit_scss,'(A)') "}"
      write(unit_scss,'(A)') ""

      write(unit_scss,'(A,A,A,I2.2,A)') "@keyframes anim-", trim(shell_name(s)), "-p", p, " {"
      write(unit_scss,'(A)') "  0%, 38% { transform: translate3d(0, 0, 0) scale(0); opacity: 0; }"
      write(unit_scss,'(A)') "  40% { transform: translate3d(0, 0, 0) scale(1.8); opacity: 1; }"
      write(unit_scss,'(A,F7.2,A,F7.2,A)') "  72% { transform: translate3d(", tx, "px, ", ty, "px, 0) scale(1.1); opacity: 1; }"
      write(unit_scss,'(A,F7.2,A,F7.2,A)') "  100% { transform: translate3d(", tx, "px, ", (ty + drop_val), "px, 0) scale(0.2); opacity: 0; }"
      write(unit_scss,'(A)') "}"
      write(unit_scss,'(A)') ""
    end do

  end do

  close(unit_scss)
  print *, "SCSS Ultimate Fireworks sukses di-generate oleh Fortran!"

  ! ------------------------------------------------------------
  ! 2. GENERATE INDEX.HTML DENGAN 144 PARTIKEL DOM
  ! ------------------------------------------------------------
  open(newunit=unit_html, file="/home/dongkrak/fortran-web/index.html", status="replace")
  write(unit_html,'(A)') "<!DOCTYPE html>"
  write(unit_html,'(A)') "<html lang='id'>"
  write(unit_html,'(A)') "<head>"
  write(unit_html,'(A)') "  <meta charset='UTF-8'>"
  write(unit_html,'(A)') "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
  write(unit_html,'(A)') "  <title>DUAAARRR! Festival Kembang Api Akbar 💥🎆</title>"
  write(unit_html,'(A)') "  <link rel='stylesheet' href='fireworks.css?v=3'>"
  write(unit_html,'(A)') "</head>"
  write(unit_html,'(A)') "<body>"
  write(unit_html,'(A)') "  <div class='overlay'>"
  write(unit_html,'(A)') "    <h1>💥 DUAR! FESTIVAL KEMBANG API 🎆</h1>"
  write(unit_html,'(A)') "    <p class='sub'>"
  write(unit_html,'(A)') "      144 Partikel Fisika Nyata · Hardware GPU Composited · 100% Pure CSS"
  write(unit_html,'(A)') "    </p>"
  write(unit_html,'(A)') "    <div class='tag'>"
  write(unit_html,'(A)') "      <span>⚡ GNU Fortran 14.3.1</span> · <span>🎨 Dart Sass 1.107.1</span>"
  write(unit_html,'(A)') "    </div>"
  write(unit_html,'(A)') "  </div>"
  write(unit_html,'(A)') ""
  write(unit_html,'(A)') "  <div class='sky'>"
  write(unit_html,'(A)') "    <div class='stars'></div>"

  ! Loop mencetak 6 Shell & masing-masing 24 partikel
  do s = 1, num_shells
    write(unit_html,'(A,A,A)') "    <div class='shell shell-", trim(shell_name(s)), "'>"
    write(unit_html,'(A)') "      <div class='rocket'></div>"
    write(unit_html,'(A)') "      <div class='flash'></div>"
    do p = 1, num_particles
      write(unit_html,'(A,I2.2,A)') "      <div class='particle p-", p, "'></div>"
    end do
    write(unit_html,'(A)') "    </div>"
  end do

  write(unit_html,'(A)') "    <div class='skyline'></div>"
  write(unit_html,'(A)') "  </div>"
  write(unit_html,'(A)') "</body>"
  write(unit_html,'(A)') "</html>"
  close(unit_html)
  print *, "index.html Ultimate Fireworks sukses di-generate!"

end program ultimate_fireworks
