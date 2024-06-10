### Projeto GitHub: Nasanews

**Versão:**  
1.0.0+1

**Ambiente:**  
Requer SDK Dart versão 3.4.1 ou superior, mas inferior a 4.0.0.
Versão do Flutter: 3.22.1

**Dados para incluir no .env**

`API_URL=https://api.nasa.gov/planetary/apod`

`API_KEY=mmjcfj5VT9eM0cLamhQkn67D0CcNyfauNSOFGlNR`

---

### Dependências

**Principais dependências:**

1. **flutter:**  
   SDK principal do Flutter.

2. **cupertino_icons (v1.0.6):**  
   Conjunto de ícones do iOS.

3. **bloc (v8.1.4) & flutter_bloc (v8.1.5):**  
   Implementação do padrão Bloc para gerenciamento de estado.

4. **json_annotation (v4.9.0):**  
   Anotações para serialização JSON.

5. **get_it (v7.7.0):**  
   Injetor de dependências.

6. **injectable (v2.4.2):**  
   Geração de código para injeção de dependências.

7. **pretty_dio_logger (v1.3.1):**  
   Logger para requisições HTTP com Dio.

8. **dio (v5.4.3+1):**  
   Cliente HTTP para Dart.

9. **shared_preferences (v2.2.3):**  
   Armazenamento de dados simples.

10. **logger (v2.3.0):**  
    Biblioteca de logging.

11. **google_fonts (v6.2.1):**  
    Fontes do Google para uso no Flutter.

12. **freezed_annotation (v2.4.1):**  
    Anotações para a biblioteca Freezed (para classes imutáveis e union types).

13. **flutter_dotenv (v5.1.0):**  
    Gerenciamento de variáveis de ambiente.

14. **intl (v0.19.0):**  
    Internacionalização e formatação.

15. **go_router (v14.1.4):**  
    Navegação declarativa.

16. **internet_connectivity_checker (v1.0.2):**  
    Verificação de conectividade com a Internet.

17. **path_provider (v2.1.3):**  
    Acesso a caminhos comuns no sistema de arquivos.

**Dependências de desenvolvimento:**

1. **flutter_test:**  
   Ferramentas para testes no Flutter.

2. **flutter_lints (v3.0.0):**  
   Conjunto de regras de lint para Dart e Flutter.

3. **freezed (v2.5.2):**  
   Geração de classes imutáveis.

4. **build_runner (v2.4.11):**  
   Executor de builds para Dart.

5. **json_serializable (v6.8.0):**  
   Geração de código para serialização JSON.

6. **injectable_generator (v2.6.1):**  
   Geração de código para a biblioteca Injectable.

7. **mockito (v5.4.4):**  
   Framework para criação de mocks em testes.

### Configuração Flutter

**uses-material-design:**  
Ativa o uso de widgets do Material Design.

**assets:**  
Lista de recursos utilizados pelo projeto, incluindo o arquivo `.env` para variáveis de ambiente.