Integrantes do Grupo: Enzo R. Caio H. e Lucas B.

Tela de Login:
Na tela de login, há um botão representado pela imagem da logo do aplicativo. Ao pressioná-lo, o login é iniciado utilizando a funcionalidade do Google Sign-In.
Tela Home:
Na tela principal, na área inferior onde fica a barra de navegação (bottom navigation bar), existe um botão de logout. Quando pressionado, ele realiza o logout da conta atualmente conectada.

Tipos de erro de provedor:
1. Erro: PlatformException: status = 10, message = DEVELOPER_ERROR
Solução:
•	Gere as chaves SHA-1/SHA-256 corretamente usando o keytool ou diretamente no Android Studio.

2.  Erro: PlatformException: status = NETWORK_ERROR
Causa: Problema de conexão de rede ou falha na comunicação com os servidores do Google.
Solução:
•	Verifique a conexão com a internet no dispositivo.
•	Confirme que as permissões de rede estão configuradas no AndroidManifest.xml:

3. Erro: Falta de configuração no AndroidManifest.xml
Causa: O Google Sign-In requer configurações específicas no AndroidManifest.xml.
Solução: Adicione os seguintes blocos:
<application>
    ...
    <meta-data
        android:name="com.google.android.gms.version"
        android:value="@integer/google_play_services_version" />
</application>

4. Erro: PlatformException: status = 12501, message = Sign-in cancelled
Causa: O usuário cancelou o login ou não aceitou as permissões solicitadas.
Solução:
•	Verifique se o fluxo do login está correto e se o botão está funcionando conforme esperado.
•	Monitore o estado de retorno do GoogleSignIn.
Exemplo:
dart
Copiar código
try {
  final GoogleSignInAccount? account = await GoogleSignIn().signIn();
  if (account == null) {
    print("Usuário cancelou o login");
  }
} catch (error) {
  print(error);
}

5.  Erro no iOS: signInSilently não funciona
Causa: O Google Sign-In requer configurações no Xcode.
Solução:
•	Configure o URL Scheme no projeto iOS.
•	Atualize o GoogleService-Info.plist no Xcode.


Dependências Utilizadas: 
•	Firebase_auth: ^5.3.3 
•	Google_sign_in: ^6.2.2 
•	Firebase_core: ^3.8.
•	Flutter 3.24.3 
•	Dart 3.5.3
Versão minima do SDK: 23

Instruções para importação do projeto: 
Obtenha o link do repositório do projeto no GitHub. Insira o link no software de desenvolvimento que está utilizando para trabalhar no aplicativo.
Como configurar o projeto:

•	Importe as dependências necessárias executando o comando flutter pub get.
•	Crie um projeto no Firebase e habilite a autenticação na aba correspondente.
•	Na página inicial do Firebase, conecte o projeto ao Flutter.
•	No terminal do projeto, execute o comando firebase login.
•	Crie um projeto no Firebase e habilite a autenticação na aba de criação.
•	O Google Sign-in requer uma impressão digital para ser usado. Você pode obter de duas formas: usando o comando ./gradlew signingReport ou keytool -exportcert -keystore "seu caminho de diretório do debug.keystore (exemplo: C:\Users\meuNome\.android\debug.keystore)>" -list -v
•	Nas configurações do projeto no firebase, vá em "Apps Android" e insira a chave SHA-1 na parte de impressões digitais.
