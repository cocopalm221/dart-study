typedef Definition = String;

class Dictionary {
  Map<String, Definition> _words = {};

  void add(String term, Definition definition) {
    _words[term] = definition;
  }

  Definition? get(String term) {
    return _words[term];
  }

  void delete(String term) {
    _words.remove(term);
  }

  void update(String term, Definition definition) {
    if (_words.containsKey(term)) {
      _words[term] = definition;
    } else {
      throw Exception('사전에 단어가 없습니다.');
    }
  }

  void showAll() {
    print('Dictionary:');
    _words.forEach((term, definition) => print('$term: $definition'));
  }

  int count() {
    return _words.length;
  }

  void upsert(String term, Definition definition) {
    _words[term] = definition;
  }

  bool exists(String term) {
    return _words.containsKey(term);
  }

  void bulkAdd(List<Map<String, String>> terms) {
    terms.forEach((term) => add(term['term']!, term['definition']!));
  }

  void bulkDelete(List<String> terms) {
    terms.forEach(delete);
  }
}

void main() {
  var dictionary = Dictionary();

  dictionary.add('cat', '고양이');
  dictionary.add('dog', '개');
  dictionary.add('bird', '새');
  dictionary.delete('bird');
  dictionary.update('cat', '고양이입니다');
  dictionary.upsert('rabbit', '토끼');
  print(dictionary.get('cat'));
  print(dictionary.count());
  print(dictionary.exists('rabbit'));

  dictionary.bulkAdd([
    {"term": "동물", "definition": "귀여워"},
    {"term": "왕크니까", "definition": "왕귀엽다"}
  ]);
  dictionary.bulkDelete(["동물", "왕크니까"]);

  dictionary.showAll();
}
