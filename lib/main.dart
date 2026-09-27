import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USCS - Dispositivos Moveis',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TelaPerfilAluno(),
    );
  }
}

class TelaPerfilAluno extends StatefulWidget {
  const TelaPerfilAluno({super.key});

  @override
  State<TelaPerfilAluno> createState() => _TelaPerfilAlunoState();
}

class _TelaPerfilAlunoState extends State<TelaPerfilAluno> {
  final TextEditingController _nomeController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Barra superior do aplicativo
      appBar: AppBar(
        title: const Text('USCS - Painel do Aluno'),
      ),

      // Drawer: Menu lateral para navegacao
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menu Academico',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Disciplinas'),
            ),
          ],
        ),
      ),

      // Body: Conteudo principal estruturado em Column
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo de entrada estilizado com TextField e InputDecoration
              TextField(
                controller: _nomeController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Nome do Aluno',
                  hintText: 'Digite seu nome completo',
                  prefixIcon: Icon(Icons.badge),
                  border: OutlineInputBorder(),
                  helperText: 'Informe o nome cadastrado na USCS',
                ),
              ),

              // SizedBox para espacamento vertical fixo
              const SizedBox(height: 16),

              // ElevatedButton para submissao do formulario
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Aluno ${_nomeController.text} salvo!'),
                    ),
                  );
                },
                child: const Text('Salvar Cadastro'),
              ),

              const SizedBox(height: 24),

              const Text(
                'Resumo de Rendimento (Flex Layout)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              // Row com Expanded (Flex 1 vs Flex 2) e Container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Primeiro bloco flexivel (flex: 1)
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 8.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.blue.shade100,
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          Icon(Icons.check_circle, color: Colors.blue),
                          SizedBox(height: 8),
                          Text(
                            'Frequencia',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('100%'),
                        ],
                      ),
                    ),
                  ),

                  // Segundo bloco flexivel (flex: 2)
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.green.shade100,
                      alignment: Alignment.center,
                      child: const Column(
                        children: [
                          Icon(Icons.star, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            'Media Geral',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('9.5 - Excelente'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}