Ruby Jobs Brazil
==============

Código fonte do site [RubyJobsBrazil.com.br](http://rubyjobsbrazil.com.br)

[![Build Status](https://travis-ci.org/mjacobus/rubyjobsbrazil.svg?branch=master)](https://travis-ci.org/mjacobus/rubyjobsbrazil)
[![Coverage Status](https://coveralls.io/repos/github/mjacobus/rubyjobsbrazil/badge.svg?branch=master)](https://coveralls.io/github/mjacobus/rubyjobsbrazil?branch=master)
[![Maintainability](https://api.codeclimate.com/v1/badges/9c1c4c4e2c8fb72abffa/maintainability)](https://codeclimate.com/github/mjacobus/rubyjobsbrazil/maintainability)

![Plataforma RubyJobsBrazil](https://raw.githubusercontent.com/mjacobus/rubyjobsbrazil/master/doc/screenshot.png)


O que é?
----------------

O objetivo deste projeto é:

- promover uma maior aceitação da Ruby linguagem no mercado de trabalho Brasileiro
- incentivar pessoas a aprender a linguagem
- dar boas vindas a novos desenvolvedores
- engajar desenvolvedores, designers e outros a contribuir com um projeto open source bacana

Quer contribuir? Veja como [aqui](#como-contribuir)


Motivação
---------

Ruby é uma linguagem fantástica. Rails é o melhor framework que se pode trabalhar. A comunidade rubista é sensacional!
Promove excelentes práticas de desenvolvimento. Desenvolve soluções que inspiram. Veja o caso do Bundle, que inspirou Compass e npm, por exemplo!

No entanto, não está fácil encontrar oportunidades para trabalhar com Ruby no Brasil. Por quê? Parece que principalmente por que as empresas se sentem mais seguras trabalhando com PHP, Java ou .Net,
talvez pelo fato de ser mais fácil contratar um dev PHP que um dev Ruby!

Mas chega desta palhaçada! =)

Ruby Jobs Brazil é um site que anuncia oportunidades de trabalho relacionados com Ruby. __Apenas__ Ruby.


Como Contribuir
---------------

Nota: Ao contribuir, você concorda que não vai receber nenhuma remuneração ou compensação pelo seu trabalho. Você deve contribuir apenas se sente [motivado](#motivação) e acredita na idéia. Para fazer o projeto rodar em sua máquina, veja o tópico [instalação](#instalação)

### Desenvolvedores

- Correções de bugs (bugs reportados, ou correção de typos)
- Novas funcionalidades. Antes de criá-las, crie uma solicitação de nova feature (issue do tipo enhancement). Esta funcionalidade deve ser discutida. Nem todas as funcionalidades serão aceitas.

### Designers
- Que tal criar (ou melhorar) a identidade visual do site? Ou um logotipo?
- Ajustar erros de css


### Outros
- Anuncie! Compartilhe esta idéia!
- Reporte bugs encontrados. Veja como [aqui](#reportando-erros)
- Ajude a corrigir erros de "portugueis"


Instalação
--------------

Clone o projeto e então:

```bash
cd rubyjobsbrazil
rake db:create db:migrate db:seed
rails s # inicia o servidor em http://localhost:3000
```
Navegue até [http://localhost:3000](http://localhost:3000)


Reportando Erros
--------------
- Clique [neste link](https://github.com/mjacobus/rubyjobsbrazil/issues), depois em "New Issue". Explique o problema e marque o problema como "bug".


Guidelines
----------

Por favor, siga as convenções [deste](http://guidelines.plataformatec.com.br) guia.

- [ruby](http://guidelines.plataformatec.com.br/ruby.html)
- [rspec](http://guidelines.plataformatec.com.br/rspec.html)
- Para Javascript, prefira [JSLint](http://www.jslint.com/).

Funcionalidades desejadas
------------------------
- Autenticação com o Oauth (Github, Linkein, Gmail, Twitter, Facebook)
- Post de Oportunidades de trabalho e divulgação
- Desenvolvedores podem postar artigos
- Visualização de contribuições Open Source no Github


Licença
--------------
- Este projeto é distribuido debaixo da licensa [MIT](https://github.com/mjacobus/rubyjobsbrazil/blob/master/MIT-LICENSE)

Contribuidores
--------------

- [Marcelo Jacobus](https://github.com/mjacobus)

## Contribuindo

1. Forke o projeto
2. Crie um branch para a sua funcionalidade, ou correção (`git checkout -b my-new-feature`)
3. Commite suas alterações (`git commit -am 'Add some feature'`)
4. Faça o push de suas alterações (`git push origin my-new-feature`)
5. Crie um Pull Request

**Apenas código testado será aceito**
