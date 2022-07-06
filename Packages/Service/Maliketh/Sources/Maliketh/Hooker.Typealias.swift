//
// Created by Mengyu Li on 2022/7/6.
//

import MachO

public extension Hooker {
    #if arch(arm) || arch(i386)
    typealias MachHeader = mach_header
    typealias SegmentCommand = segment_command
    typealias Section = section
    static var LC_SEGMENT: Int32 { LC_SEGMENT }
    typealias NList = nlist
    #elseif arch(arm64) || arch(x86_64)
    typealias MachHeader = mach_header_64
    typealias SegmentCommand = segment_command_64
    typealias Section = section_64
    static var LC_SEGMENT: Int32 { LC_SEGMENT_64 }
    typealias NList = nlist_64
    #else
    #error("Not Support")
    #endif
}
