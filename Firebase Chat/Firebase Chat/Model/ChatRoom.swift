//
//  ChatRoom.swift
//  Firebase Chat
//
//  Created by Hayden Hastings on 6/25/19.
//  Copyright © 2019 Hayden Hastings. All rights reserved.
//

import Foundation
import Firebase
import MessageKit

// MARK: - ChatRoom Model
struct ChatRoom {
    
    var name: String?
    var uid: String?
    var timestamp: NSNumber?
    var id: String?
    
}

// MARK: - Struct Message
struct Message: MessageType {
    
    let chatRoom: ChatRoom?
    var text: String
    var displayName: String
    var senderId: String
    
    var sender: SenderType { return Sender(senderId: senderId, displayName: displayName) }
    var messageId: String
    var sentDate: Date { return Date() }
    var kind: MessageKind { return .text(text)}
    
}

// MARK: - Making ChatRoom into dictionaries.
extension ChatRoom {
    static func transformChatRoom(dictionary: [String : Any], key: String) -> ChatRoom {
        
        var chatRoom = ChatRoom()
        
        chatRoom.id = key
        chatRoom.name = dictionary["chat_name"] as? String
        chatRoom.uid = dictionary["uid"] as? String
        chatRoom.timestamp = dictionary["timeStamp"] as? NSNumber
        
        return chatRoom
    }
}
