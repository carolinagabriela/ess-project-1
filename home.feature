Feature: remover review
	As a administrador
	I want to remover um review mostrado na página inicial
	So that eu possa gerenciar reviews na plataforma

Scenario: Reviews exibidas na home
  Given eu estou logado como "usuário comum"
  And o sistema tem cadastrado apenas as reviews de "Fulano", "Sicrano" e "Beltrano" com suas músicas e notas
  When eu acesso a página inicial
  Then eu vejo as reviews de "Fulano", "Sicrano" e "Beltrano" com suas músicas e notas

Scenario: Administrador remove review com sucesso
  Given eu estou na página "Home"
  And eu estou logado como administrador
  And eu vejo uma review "Let Down" de "Fulano"
  When eu clico para excluir review de "Let Down" feita por “Fulano”
  Then a review "Let Down" de "Fulano" desaparece da lista


Scenario: Administrador cancela exclusão
  Given eu estou logado como administrador
  And eu estou na página "Home"
  When eu requisito a exclusão da review de "Something" feita por “Sicrano”
  And eu cancelo a exclusão
  Then a review "Something" permanece na lista de reviews

Scenario: Reviews não exibidas na home (nenhuma review cadastrada)
  Given eu estou logado como "usuário comum"
  And o sistema não tem cadastrado nenhuma review
  When eu acesso a página inicial
  Then não vejo nenhuma review