
DefinitionBlock ("", "SSDT", 2, "CORP ", "SsdtEC", 0x00001000)
{
    External (\_SB.PCI0.LPC, DeviceObj)
    External (\_SB.PCI0.LPC.EC0, DeviceObj)

    Scope (\_SB.PCI0.LPC.EC0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (\_SB.PCI0.LPC)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}