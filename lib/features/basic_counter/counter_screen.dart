import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_provider.dart';

/// Sayaç ekranı - ConsumerWidget kullanımını öğretir
/// ConsumerWidget, provider'ları dinlemek için kullanılır
class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch() ile provider'ı dinle
    // Bu widget, counterProvider değiştiğinde otomatik olarak yeniden build edilir
    final count = ref.watch(counterProvider);
    
    // ref.read() ile provider'a bir kez erişim
    // Bu, sadece değeri okumak için kullanılır, dinlemez
    final operations = ref.read(counterOperationsProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sayaç - Aşama 1'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Provider'dan gelen değeri göster
            Text(
              '$count',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 32),
            
            // Açıklama metni
            const Text(
              'Bu sayaç Riverpod StateProvider kullanır',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            
            // Butonlar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: operations.decrement,
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: operations.reset,
                  child: const Text('Sıfırla'),
                ),
                ElevatedButton(
                  onPressed: operations.increment,
                  child: const Text('+'),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Provider bilgileri
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                children: [
                  Text(
                    'Öğrenilen Kavramlar:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('• StateProvider - Basit state yönetimi'),
                  Text('• ConsumerWidget - Provider dinleme'),
                  Text('• ref.watch() - Sürekli dinleme'),
                  Text('• ref.read() - Tek seferlik okuma'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

