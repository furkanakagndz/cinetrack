import 'package:flutter_riverpod/flutter_riverpod.dart';

// Aşama 1: Temel Riverpod Kavramları
// Bu dosya StateProvider kullanımını öğretir

/// Basit bir sayaç provider'ı
/// StateProvider, basit state yönetimi için kullanılır
final counterProvider = StateProvider<int>((ref) => 0);

/// Sayaç işlemleri için provider
/// Bu provider, counterProvider'ı dinler ve işlemleri yapar
final counterOperationsProvider = Provider<CounterOperations>((ref) {
  return CounterOperations(ref);
});

/// Sayaç işlemleri sınıfı
class CounterOperations {
  final Ref _ref;
  
  CounterOperations(this._ref);
  
  /// Sayacı artır
  void increment() {
    _ref.read(counterProvider.notifier).state++;
  }
  
  /// Sayacı azalt
  void decrement() {
    _ref.read(counterProvider.notifier).state--;
  }
  
  /// Sayacı sıfırla
  void reset() {
    _ref.read(counterProvider.notifier).state = 0;
  }
  
  /// Mevcut değeri al
  int get currentValue => _ref.read(counterProvider);
}
