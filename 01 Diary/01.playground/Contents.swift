
import UIKit

enum Tag: String {
    case happy = "[life is good]"
    case normal = "[lifeislife]"
    case tricky = "[it'scomplicated]"
    case philosophical = "[whatisthemeaningoflife?]"
    case playfull = "[cometomemomma]"
    case sad = "[pleasekillme]"
    case angry = "[fckitall]"
    case noTag = ""
    
}

enum Emoji: String {
    case happy = "😃"
    case shy = "😳"
    case kiss = "😘"
    case hug = "🤗"
    case neutral = "😐"
    case thinking = "🤔"
    case sleepy = "😴"
    case sad = "😢"
    case angry = "😡"
    case scared = "😬"
    case sick = "🤢"
    case noEmoji = ""
}

var date = Date()

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MMMM dd yyyy HH:mm"

let stringDate = dateFormatter.string(from: date)

class Diary {
    
    var userDate: String?
    
    var title: String? {
        didSet {
            print("title for \(self) has been set from \(oldValue ?? "") to \(self.title ?? "")")
        }
    }
    
    var text: String? {
        didSet {
            print("text for \(self) has been changed from \(oldValue ?? "") to \(self.text ?? "")")
        }
    }
    
    var tags: [Tag]?
    var emoji: [Emoji]?
    
    init?(userDate: String?, title: String?, emoji: [Emoji]?, tags: [Tag]?, text: String?) {
        self.userDate = userDate
        self.title = title
        self.emoji = emoji
        self.tags = tags
        self.text = text
        
        if userDate != stringDate {
            print("You inserted Invalid date. Could not initialize an object" + "\n")

            return nil
        }
        
        print(self.description())
        
        let infoLog = """
        Initial info:
        date set to: \(userDate ?? ""),
        title set to: \(title ?? ""),
        emoji set to: \(emoji ?? [Emoji.noEmoji]),
        tags set to: \(tags ?? [Tag.noTag]),
        text set to: \(text ?? "")
        --------------------------------------------
        
        """
        print(infoLog)
    }
    
    convenience init?(title: String? = "", emoji: [Emoji]? = [Emoji.noEmoji], tags: [Tag]? = [Tag.noTag], text: String? = "") {
        self.init(userDate: stringDate, title: title, emoji: emoji, tags: tags, text: text)
    }

    func description() -> String {
        
        var stringTag = ""
        if tags != nil {
            for i in 0..<tags!.count {
                stringTag.append(String(describing: tags![i].rawValue) + " ")
            }
        }
        
        var stringEmoji = ""
        if emoji != nil {
            for i in 0..<emoji!.count {
                stringEmoji.append(String(describing: emoji![i].rawValue))
            }
        }
        
        let description = """
        \(userDate ?? "")
        
        \(title ?? "")
        \(stringEmoji)
        \(stringTag)
        
        \(text ?? "")
        
        --------------------------------------------
        
        """
        
        return description
    }
    
}

var a = Diary(title: "Autumn...", emoji: [.angry, .sad], tags: [.sad, .philosophical, .tricky], text: "Sumno & zumno & duzhe pichalno...")

var b = Diary(userDate: "sjdhjsdhjshdjhsdjhsjd", title: "zdmsn", emoji: [.hug], tags: [.happy], text: "skd")

var c = Diary(emoji: [.happy, .hug, .kiss], tags: [.happy, .playfull, .tricky], text: "Not now")

var d = Diary()

var f = Diary(userDate: stringDate, title: "How about now?", emoji: [.kiss, .neutral], tags: [.normal], text: "New date")

var t = Diary(userDate: "falseDate", title: "falseTitle", emoji: [.angry], tags: [.angry], text: "falseText")

a?.title = "Depression..."
b?.title = "Nigilism"



