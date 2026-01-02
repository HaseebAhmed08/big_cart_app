import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class YourItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String imageUrl;
  final VoidCallback? onDelete; // Yeh list se item remove karega (parent mein setState ke saath)

  const YourItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
     this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Unique key zaroori hai dismissible ke liye (index ya item id se banao)
      key: ValueKey(title), // ya UniqueKey() ya item.id agar ho

      // Left side swipe (start)
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        // Full swipe se delete (dismiss)
        dismissible: DismissiblePane(
          onDismissed: onDelete!, // Yahan item remove ho jayega
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Agar tap pe bhi delete karna ho (swipe bina)
              onDelete!();
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          // SlidableAction(
          //   onPressed: (context) {
          //     // Share functionality yahan add kar sakte ho
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       const SnackBar(content: Text('Shared!')),
          //     );
          //   },
          //   backgroundColor: const Color(0xFF21B7CA),
          //   foregroundColor: Colors.white,
          //   icon: Icons.share,
          //   label: 'Share',
          // ),
        ],
      ),

      // Right side swipe (end)
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            flex: 2,
            onPressed: (context) {
              // Archive functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Archived!')),
              );
            },
            backgroundColor: const Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: (context) {
              // Save functionality
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Saved!')),
              );
            },
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Save',
          ),
        ],
      ),

      // Main visible child
      child: ListTile(
        leading: Image.network(
          imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          
        ),        
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text( 
          price,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}