=== git ===
criar repositório baseado em projeto existente: https://help.github.com/en/articles/adding-an-existing-project-to-github-using-the-command-line
git status --vê se tem alteração
git rm *.* --apaga arquivos
git add . --add todas alterações
git commit -m "removendo arquivos" --faz commit repo local
git push -u origin master --push repo remoto
git push heroku master //toda vez que tiver alteração e quiser subir em produção
git reset --hard --reverte local

=== heroku ===
no dir do projeto:
> heroku login
> heroku create appname
> git push heroku master //toda vez que tiver alteração e quiser subir em produção
> heroku open
> heroku logs --tail
> heroku config //vê url bd
> heroku pg //vê dados bd
> heroku ps:scale web=1 //add uma instância web
Criar Procfile na raiz do projeto 
ex. web: java $JAVA_OPTS -Dserver.port=$PORT -Dspring.profiles.active=prod -jar target/sgt-0.0.1-SNAPSHOT.jar
> heroku ps //escalar appname
> heroku ps:scale web=2
> heroku config:set ENERGY="20 GeV" //criar var ambiente
> heroku config //listar var ambiente
Para acessar bd ir em datastore > settings > credentials > heroku CLI
Executar esse comando na raiz do projeto: pgsql deve estar configurado no PATH
ex. heroku pg:psql postgresql-asymmetrical-61306 --app sgtifgo
Para restaurar backup do banco: cria o backup sql no pgadmin: botão direito no banco > backup > plain > gere arquivo .sql e jogue na raiz do projeto
Altere owner do arquivo .sql  por usuário do banco no heroku
ex. replace all: 'TO postgres' por: 'TO zpsjlzbixfkzxt'
Em heroku pg:sql, mande executar o arquivo criado
\i sgt.sql
para tirar dúvidas de comandos: 
\copyright para mostrar termos de distribuição
\h para ajuda com comandos SQL
\? para ajuda com comandos do psql
\g ou terminar com ponto-e-vírgula para executar a consulta
\q para sair
