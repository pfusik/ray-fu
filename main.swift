import Foundation

let level = CommandLine.argc == 2 ? Int(CommandLine.arguments[1])! : 6
let pgm = ArrayRef<UInt8>(repeating: 0, count: RayTracer.pgmLength)
RayTracer.render(pgm, level)
try Data(pgm).write(to: URL(fileURLWithPath: "swift.pgm"))
