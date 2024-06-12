class AdicionarModelo {
  String id;
  String tipo;
  String? nota;
  double valor;
  DateTime data;
  String categoria;

  AdicionarModelo({
    required this.id,
    required this.data, 
    required this.valor,
    required this.tipo,
    this.nota = '',
    required this.categoria
  });

  AdicionarModelo.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        tipo = map['tipo'],
        valor = map['valor'],
        nota = map['nota']?? '',
        categoria = map['categoria'],
        data = DateTime.parse(map['data'] as String);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'valor': valor,
      'nota': nota,
      'categoria': categoria,
      'data': data.toIso8601String(),
    };
  }
}