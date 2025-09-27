class Bidirectionalmap<K,V> {
  final Map<K,V> _forward = {};
  final Map<V,K> _reverse = {};
  V? operator [](K key) =>_forward[key];
  K? inverse(V value)=>_reverse[value];
  void add(K key, V value) {
    _forward[key] = value;
    _reverse[value] = key;
  }
  values()=>_forward?.values;
}
