onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tone_generation_vhd_tst/audiol
add wave -noupdate /tone_generation_vhd_tst/audior
add wave -noupdate /tone_generation_vhd_tst/clk
add wave -noupdate /tone_generation_vhd_tst/key
add wave -noupdate /tone_generation_vhd_tst/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 200
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {105 ms}
