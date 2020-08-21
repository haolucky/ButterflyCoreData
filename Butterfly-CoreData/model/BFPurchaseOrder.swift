//
//  BFCancellation.swift
//  Butterfly-CoreData
//
//  Created by Chris on 2020/8/21.
//  Copyright © 2020 Butterfly. All rights reserved.
//

import CoreData

enum DecoderConfigurationError: Error {
  case missingManagedObjectContext
}

extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}

class BFPurchaseOrder: NSManagedObject {
    enum CodingKeys: CodingKey {
      case active_flag, id, approval_status, delivery_note, device_key, issue_date, last_updated, last_updated_user_entity_id, preferred_delivery_date, purchase_order_number, sent_date, server_timestamp, status, supplier_id
    }

    required convenience init(from decoder: Decoder) throws {
      guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
        throw DecoderConfigurationError.missingManagedObjectContext
      }

      self.init(context: context)

      let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.active_flag = try container.decode(Bool.self, forKey: .active_flag)
        self.approval_status = try container.decode(Int64.self, forKey: .approval_status)
        self.delivery_note = try container.decode(String.self, forKey: .delivery_note)
        self.device_key = try container.decode(String.self, forKey: .device_key)
        self.issue_date = try container.decode(Date.self, forKey: .issue_date)
        self.last_updated = try container.decode(Date.self, forKey: .last_updated)
        self.last_updated_user_entity_id = try container.decode(Int64.self, forKey: .last_updated_user_entity_id)
        self.preferred_delivery_date = try container.decode(Date.self, forKey: .preferred_delivery_date)
        self.purchase_order_number = try container.decode(String.self, forKey: .purchase_order_number)
        self.sent_date = try container.decode(Date.self, forKey: .sent_date)
        self.server_timestamp = try container.decode(Int64.self, forKey: .server_timestamp)
        self.status = try container.decode(Int64.self, forKey: .status)
        self.supplier_id = try container.decode(Int64.self, forKey: .supplier_id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(active_flag, forKey: .active_flag)
        try container.encode(approval_status, forKey: .approval_status)
        try container.encode(delivery_note, forKey: .delivery_note)
        try container.encode(device_key, forKey: .device_key)
        try container.encode(issue_date, forKey: .issue_date)
        try container.encode(last_updated, forKey: .last_updated)
        try container.encode(last_updated_user_entity_id, forKey: .last_updated_user_entity_id)
        try container.encode(preferred_delivery_date, forKey: .preferred_delivery_date)
        try container.encode(purchase_order_number, forKey: .purchase_order_number)
        try container.encode(sent_date, forKey: .sent_date)
        try container.encode(server_timestamp, forKey: .server_timestamp)
        try container.encode(status, forKey: .status)
        try container.encode(supplier_id, forKey: .supplier_id)
    }
}

class BFReceipt: NSManagedObject {
    enum CodingKeys: CodingKey {
      case active_flag, id, last_updated, last_updated_user_entity_id, product_item_id, transient_identifier, created, received_quantity, sent_date
    }

    required convenience init(from decoder: Decoder) throws {
      guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
        throw DecoderConfigurationError.missingManagedObjectContext
      }

      self.init(context: context)

      let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.active_flag = try container.decode(Bool.self, forKey: .active_flag)
        self.last_updated = try container.decode(Date.self, forKey: .last_updated)
        self.last_updated_user_entity_id = try container.decode(Int64.self, forKey: .last_updated_user_entity_id)
        self.product_item_id = try container.decode(Int64.self, forKey: .product_item_id)
        self.transient_identifier = try container.decode(String.self, forKey: .transient_identifier)
        self.created = try container.decode(Date.self, forKey: .created)
        self.received_quantity = try container.decode(Int64.self, forKey: .received_quantity)
        self.sent_date = try container.decode(Date.self, forKey: .sent_date)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(active_flag, forKey: .active_flag)
        try container.encode(last_updated, forKey: .last_updated)
        try container.encode(last_updated_user_entity_id, forKey: .last_updated_user_entity_id)
        try container.encode(product_item_id, forKey: .product_item_id)
        try container.encode(transient_identifier, forKey: .transient_identifier)
        try container.encode(created, forKey: .created)
        try container.encode(received_quantity, forKey: .received_quantity)
        try container.encode(sent_date, forKey: .sent_date)
    }
}



class BFItem: NSManagedObject {
    enum CodingKeys: CodingKey {
      case active_flag, id, last_updated, last_updated_user_entity_id, product_item_id, quantity, transient_identifier
    }

    required convenience init(from decoder: Decoder) throws {
      guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
        throw DecoderConfigurationError.missingManagedObjectContext
      }

      self.init(context: context)

      let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.active_flag = try container.decode(Bool.self, forKey: .active_flag)
        self.last_updated = try container.decode(Date.self, forKey: .last_updated)
        self.last_updated_user_entity_id = try container.decode(Int64.self, forKey: .last_updated_user_entity_id)
        self.product_item_id = try container.decode(Int64.self, forKey: .product_item_id)
        self.quantity = try container.decode(Int64.self, forKey: .quantity)
        self.transient_identifier = try container.decode(Int64.self, forKey: .transient_identifier)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(active_flag, forKey: .active_flag)
        try container.encode(product_item_id, forKey: .product_item_id)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(transient_identifier, forKey: .transient_identifier)
        try container.encode(last_updated, forKey: .last_updated)
        try container.encode(last_updated_user_entity_id, forKey: .last_updated_user_entity_id)
    }
}

class BFInvoice: NSManagedObject {
    enum CodingKeys: CodingKey {
      case active_flag, id, invoice_number, created, last_updated, last_updated_user_entity_id, receipt_sent_date, received_status, transient_identifier
    }

    required convenience init(from decoder: Decoder) throws {
      guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
        throw DecoderConfigurationError.missingManagedObjectContext
      }

      self.init(context: context)

      let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.active_flag = try container.decode(Bool.self, forKey: .active_flag)
        self.last_updated = try container.decode(Date.self, forKey: .last_updated)
        self.last_updated_user_entity_id = try container.decode(Int64.self, forKey: .last_updated_user_entity_id)
        self.invoice_number = try container.decode(String.self, forKey: .invoice_number)
        self.transient_identifier = try container.decode(String.self, forKey: .transient_identifier)
        self.created = try container.decode(Date.self, forKey: .created)
        self.receipt_sent_date = try container.decode(Date.self, forKey: .receipt_sent_date)
        self.received_status = try container.decode(Int64.self, forKey: .received_status)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(active_flag, forKey: .active_flag)
        try container.encode(last_updated, forKey: .last_updated)
        try container.encode(last_updated_user_entity_id, forKey: .last_updated_user_entity_id)
        try container.encode(invoice_number, forKey: .invoice_number)
        try container.encode(transient_identifier, forKey: .transient_identifier)
        try container.encode(created, forKey: .created)
        try container.encode(receipt_sent_date, forKey: .receipt_sent_date)
        try container.encode(received_status, forKey: .received_status)
    }
}

class BFCancellation: NSManagedObject {
    enum CodingKeys: CodingKey {
        case created, id, last_updated_user_entity_id, ordered_quantity, product_item_id, transient_identifier
    }

    required convenience init(from decoder: Decoder) throws {
      guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext else {
        throw DecoderConfigurationError.missingManagedObjectContext
      }

      self.init(context: context)

      let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.created = try container.decode(Date.self, forKey: .created)
        self.ordered_quantity = try container.decode(Int64.self, forKey: .ordered_quantity)
        self.product_item_id = try container.decode(Int64.self, forKey: .product_item_id)
        self.transient_identifier = try container.decode(String.self, forKey: .transient_identifier)
        self.last_updated_user_entity_id = try container.decode(Int64.self, forKey: .last_updated_user_entity_id)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(created, forKey: .created)
        try container.encode(ordered_quantity, forKey: .ordered_quantity)
        try container.encode(product_item_id, forKey: .product_item_id)
        try container.encode(transient_identifier, forKey: .transient_identifier)
        try container.encode(last_updated_user_entity_id, forKey: .last_updated_user_entity_id)
    }
}

