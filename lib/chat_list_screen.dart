import 'package:flutter/material.dart';
import 'chat_detail_screen.dart'; // ⬅️ Import the new chat screen

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {
        'name': 'John Doe',
        'message': 'Hey! How are you doing?',
        'time': '2m',
        'unread': true,
        'image': 'images/pngs/profile1.jpg',
      },
      {
        'name': 'Emily Rose',
        'message': 'Let’s catch up tomorrow!',
        'time': '10m',
        'unread': false,
        'image': 'images/pngs/profile2.jpg',
      },
      {
        'name': 'David Smith',
        'message': 'Got your files, thanks!',
        'time': '1h',
        'unread': true,
        'image': 'images/pngs/profile3.jpg',
      },
      {
        'name': 'Sophia Brown',
        'message': 'Check your email 📩',
        'time': '3h',
        'unread': false,
        'image': 'images/pngs/profile4.jpg',
      },
      {
        'name': 'Liam Johnson',
        'message': 'See you soon!',
        'time': '1d',
        'unread': false,
        'image': 'images/pngs/profile5.jpg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Messages",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[100],
      body: ListView.builder(
        itemCount: chats.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return _buildChatTile(context, chat);
        },
      ),
    );
  }

  // Chat tile widget
  Widget _buildChatTile(BuildContext context, Map<String, dynamic> chat) {
    return InkWell(
      onTap: () {
        // 👇 Navigate to chat screen with user data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                ChatDetailScreen(name: chat['name'], image: chat['image']),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Row(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(chat['image']),
              onBackgroundImageError: (_, __) {},
            ),
            const SizedBox(width: 12),

            // Name & Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    chat['message'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: chat['unread']
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),

            // Time + Unread Dot
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time'],
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 6),
                if (chat['unread'])
                  Container(
                    height: 10,
                    width: 10,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
