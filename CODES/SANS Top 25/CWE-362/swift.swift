import Foundation

let path = "target.txt"
try! Data("initial".utf8).write(to: URL(fileURLWithPath: path))

let q1 = DispatchQueue(label: "racer1")
q1.async {
    Thread.sleep(forTimeInterval: 0.05)
    let content = try! Data(contentsOf: URL(fileURLWithPath: path))
    if String(data: content, encoding: .utf8) == "initial" {
        try! "raced_by_q1".data(using: .utf8)!.write(to: URL(fileURLWithPath: path))
        print("Q1 wrote after check")
    }
}

let q2 = DispatchQueue(label: "racer2")
q2.async {
    let content = try! Data(contentsOf: URL(fileURLWithPath: path))
    if String(data: content, encoding: .utf8) == "initial" {
        try! "raced_by_q2".data(using: .utf8)!.write(to: URL(fileURLWithPath: path))
        print("Q2 wrote after check")
    }
}

Thread.sleep(forTimeInterval: 0.2)

let finalContent = try! Data(contentsOf: URL(fileURLWithPath: path))
print("Final: \(String(data: finalContent, encoding: .utf8)!)")

/*
Hardcoded input: Queues race on file.
Manual validation: swift run; output varies (e.g., "raced_by_q1"), no compile/runtime error.
*/