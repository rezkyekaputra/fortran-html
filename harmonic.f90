! ============================================================
! Generator SASS/SCSS Berbasis Fisika Pegas Fortran
! Menghitung Persamaan Diferensial Harmonik Teredam
! x(t) = A * exp(-gamma * t) * cos(omega * t)
! ============================================================
program fortran_sass_generator
  implicit none

  integer :: i, unit_scss
  real :: t, y, rotasi
  real, parameter :: PI = 3.14159265
  real, parameter :: gamma = 1.8    ! Koefisien redaman
  real, parameter :: omega = 12.0   ! Frekuensi osilasi
  real, parameter :: amplitudo = 45.0

  open(newunit=unit_scss, file="/home/dongkrak/fortran-web/harmonic.scss", status="replace")

  ! Header SCSS Modern
  write(unit_scss,'(A)') "/// =========================================="
  write(unit_scss,'(A)') "/// DART SASS + FORTRAN PHYSICS ENGINE (DUAR) 💥"
  write(unit_scss,'(A)') "/// =========================================="
  write(unit_scss,'(A)') "@use 'sass:math';"
  write(unit_scss,'(A)') "@use 'sass:color';"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "$primary-glow: #fe8019;"
  write(unit_scss,'(A)') "$cyan-glow: #83a598;"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') "@keyframes fortran-spring-drop {"

  ! Loop kalkulasi persamaan fisika langsung ke keyframes SCSS
  do i = 0, 20
    t = real(i) / 20.0
    ! Rumus fisika pegas
    y = amplitudo * exp(-gamma * t) * cos(omega * t)
    rotasi = 8.0 * exp(-gamma * t) * sin(omega * t)

    write(unit_scss,'(A,F5.1,A)') "  ", (t * 100.0), "% {"
    write(unit_scss,'(A,F6.2,A,F5.2,A)') "    transform: translateY(", y, "px) rotate(", rotasi, "deg);"
    write(unit_scss,'(A,F4.2,A)') "    box-shadow: 0 10px 30px rgba(254, 128, 25, ", (0.2 + (0.5 * (1.0 - t))), ");"
    write(unit_scss,'(A)') "  }"
  end do

  write(unit_scss,'(A)') "}"
  write(unit_scss,'(A)') ""
  write(unit_scss,'(A)') ".physics-box {"
  write(unit_scss,'(A)') "  width: 140px;"
  write(unit_scss,'(A)') "  height: 140px;"
  write(unit_scss,'(A)') "  margin: 40px auto;"
  write(unit_scss,'(A)') "  border-radius: 20px;"
  write(unit_scss,'(A)') "  background: linear-gradient(135deg, $primary-glow, color.adjust($primary-glow, $hue: 40deg));"
  write(unit_scss,'(A)') "  display: flex;"
  write(unit_scss,'(A)') "  align-items: center;"
  write(unit_scss,'(A)') "  justify-content: center;"
  write(unit_scss,'(A)') "  color: #fff;"
  write(unit_scss,'(A)') "  font-weight: bold;"
  write(unit_scss,'(A)') "  font-family: sans-serif;"
  write(unit_scss,'(A)') "  animation: fortran-spring-drop 2.2s cubic-bezier(0.25, 1, 0.5, 1) infinite;"
  write(unit_scss,'(A)') "}"

  close(unit_scss)
  print *, "SCSS fisika berhasil di-generate dari Fortran!"

end program fortran_sass_generator
