onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pulselength2audio_vhd_tst/audiol
add wave -noupdate /pulselength2audio_vhd_tst/audior
add wave -noupdate /pulselength2audio_vhd_tst/clk_dev
add wave -noupdate /pulselength2audio_vhd_tst/pulslength
add wave -noupdate /pulselength2audio_vhd_tst/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50160000 ps} 0} {{Cursor 2} {18160000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {10138339 ps} {76369483 ps}
