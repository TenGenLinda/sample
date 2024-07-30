//
//  Document.swift
//  Sample
//
//  Created by Yuriy Scherbanovskiy on 07.07.2023.
//

import Cocoa

class Document: NSDocument {

    static let SampleDocumentType = "com.example.plain-text"
    static let SampleDocumentTypeUtf16 = "com.example.plain-text-utf16"

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }
    
    fileprivate var text: String = "Hello, world!"
    
    func updateText(_ text: String) {
       self.text = text;
       self.updateChangeCount(.changeDone);
    }
    
    override class var autosavesInPlace: Bool {
        return false
    }
    
    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Document Window Controller")) as! NSWindowController
        
        windowController.contentViewController?.representedObject = self.text
        
        self.addWindowController(windowController)
    }
    
    override func save(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType, completionHandler handler: @escaping (Error?) -> Void) {
        super.save(to: url, ofType: typeName, for: saveOperation, completionHandler: handler)
    }

    override func save(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType, delegate: Any?, didSave didSaveSelector: Selector?, contextInfo: UnsafeMutableRawPointer?) {
        super.save(to: url, ofType: typeName, for: saveOperation, delegate: delegate, didSave: didSaveSelector, contextInfo: contextInfo)
    }
    
    override func write(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType, originalContentsURL absoluteOriginalContentsURL: URL?) throws {
        try super.write(to: url, ofType: typeName, for: saveOperation, originalContentsURL: absoluteOriginalContentsURL);
    }
        
    override func data(ofType typeName: String) throws -> Data {
        return text.data(using: .utf8)!
    }

    override func read(from data: Data, ofType typeName: String) throws {
        self.text = String(data: data, encoding: .utf8)!
    }
}

class PZDocument: Document {

    override class var autosavesInPlace: Bool {
        return true
    }
    
    override func data(ofType typeName: String) throws -> Data {
        return text.data(using: .utf16)!
    }

    override func read(from data: Data, ofType typeName: String) throws {
        self.text = String(data: data, encoding: .utf16)!
    }
}



