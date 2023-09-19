import SwiftUI
import UniformTypeIdentifiers

@available(iOS 16.0, macOS 13.0, *)
extension OPML: Transferable {
    public static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(contentType: .fileURL,
                           shouldAttemptToOpenInPlace: false // url is temporary
        ) { opml in
            let resultURL = FileManager.default.temporaryDirectory
                .appending(component: opml.title ?? UUID().uuidString, directoryHint: .notDirectory)
                .appendingPathExtension("opml")
            if FileManager.default.fileExists(atPath: resultURL.path(percentEncoded: false)) {
                try FileManager.default.removeItem(at: resultURL)
            }
            let data = opml.xml.data(using: .utf8) ?? Data()
            try data.write(to: resultURL, options: [.atomic])
            let sentTransferredFile: SentTransferredFile = .init(resultURL, allowAccessingOriginalFile: true)
            return sentTransferredFile
        } importing: { opmlFile in
            let data: Data = try .init(
                contentsOf: opmlFile.file,
                options: [.uncached]
            )
            return (try? OPML(data)) ?? OPML(entries: [])
        }
        
        DataRepresentation(contentType: .text) { opml in
            opml.xml.data(using: .utf8) ?? Data()
        } importing: { return (try? OPML($0)) ?? OPML(entries: []) }
            .suggestedFileName("ChatOnMac-Packages.opml")
        //        DataRepresentation(contentType: UTType(exportedAs: "public.opml")) { opml in
        //            opml.xml(indented: true).data(using: .utf8) ?? Data()
        //        } importing: { return (try? OPML($0)) ?? OPML(entries: []) }
//        .suggestedFileName("ManabiReaderUserFeeds.opml")
    }
}
