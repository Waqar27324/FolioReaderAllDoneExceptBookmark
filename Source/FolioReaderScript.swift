//
//  FolioReaderScript.swift
//  NFolioReaderKit
//
//  Created by Brian Mc Alister on 04.02.21.
//

import WebKit

class FolioReaderScript: WKUserScript {
    
    init(source: String) {
        if #available(iOS 14.0, *) {
            super.init(source: source, injectionTime: .atDocumentEnd, forMainFrameOnly: true, in: .page)
            } else {
                // Fallback on earlier versions
                super.init(source: source,
                           injectionTime: .atDocumentEnd,
                           forMainFrameOnly: true)
            }
    }
    
    static let bridgeJS: FolioReaderScript = {
        let jsURL = Bundle.frameworkBundle().url(forResource: "Bridge", withExtension: "js")!
        let jsSource = try! String(contentsOf: jsURL)
        return FolioReaderScript(source: jsSource)
    }()
    
    static let cssInjection: FolioReaderScript = {
        let cssURL = Bundle.frameworkBundle().url(forResource: "Style", withExtension: "css")!
        let cssString = try! String(contentsOf: cssURL)
        return FolioReaderScript(source: cssInjectionSource(for: cssString))
    }()
    
    static func cssInjection(overflow: String) -> FolioReaderScript {
        let cssString = "html{overflow:\(overflow)}"
        return FolioReaderScript(source: cssInjectionSource(for: cssString))
    }
    
    private static func cssInjectionSource(for content: String) -> String {
        let oneLineContent = content.components(separatedBy: .newlines).joined()
        let source = """
        var style = document.createElement('style');
        style.type = 'text/css'
        style.innerHTML = '\(oneLineContent)';
        document.head.appendChild(style);
        """
        return source
    }
    
}

extension WKUserScript {
    
    func addIfNeeded(to webView: WKWebView?) {
        guard let controller = webView?.configuration.userContentController else { return }
        let alreadyAdded = controller.userScripts.contains { [unowned self] in
            return $0.source == self.source &&
                $0.injectionTime == self.injectionTime &&
                $0.isForMainFrameOnly == self.isForMainFrameOnly
        }
        if alreadyAdded { return }
        controller.addUserScript(self)
    }
    
}
