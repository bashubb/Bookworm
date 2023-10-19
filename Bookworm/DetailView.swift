//
//  DetailView.swift
//  Bookworm
//
//  Created by HubertMac on 19/10/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(Color.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Uknown Author")
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)
            
            Text("Book has been read: \(formatDate())")
                .foregroundStyle(Color.secondary)
                .padding()
        }
        .navigationTitle(book.title ?? "Uknown Book")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Book?", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel){}
        } message: {
            Text("Are you sure")
        }
        .toolbar {
            Button{
                showingDeleteAlert = true
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
    }
    func deleteBook() {
        moc.delete(book)
        
        try? moc.save()
        dismiss()
    }
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: book.date ?? Date())
    }
}

