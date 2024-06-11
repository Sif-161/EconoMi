
class AdicionarModelo {
  String id;
  String tipo;
  String? descricao;
  double valor;
  DateTime data;

  AdicionarModelo({
    required this.id,
    required this.data, 
    required this.valor,
    required this.tipo,
    this.descricao
  });

  AdicionarModelo.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        tipo = map['tipo'],
        valor = map['valor'],
        descricao = map['descricao'],
        data = DateTime.parse(map['data'] as String);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tipo': tipo,
      'valor': valor,
      'descricao': descricao,
      'data': data.toIso8601String(),
    };
  }
}