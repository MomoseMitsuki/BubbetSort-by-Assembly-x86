# BubbetSort-by-Assembly-x86

使用80386指令集和masm32汇编开发工具包实现

main stack

[ebp]        ebp

[ebp-0x4]    arr.length

[ebp-0x8]    i

...

[ebx]        &arr[0]

BubbetSort stack

[ebp+0xC]    arr.length

[ebp+0x8]    &arr[0]

[ebp+0x4]    call BubbetSort + 0x5

[ebp]        ebp

[ebp-0x4]    i

[ebp-0x8]    j

[ebp-0x10]   i
