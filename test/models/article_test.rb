require './test/test_helper'
require './app/models/article'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_it_works
    puts "testing model instance checking"
    cur_dir = Dir.pwd
    puts "Currrent Directory is #{cur_dir}"
    assert true
  end

  def test_article_get_all_using_sql
    obj = Article.new()
    articles = obj.execute_sql_statement('SELECT * FROM articles')


    sz = 0
    if articles.nil?
      puts "No article found using SQL query."
    else
      articles.each do |row|
        # conveniently, row is a hash
        # the keys are the fields, as you'd expect
        # the values are pre-built ruby primitives mapped from their corresponding field types in MySQL
        sz += 1
      end
    end
    assert sz > 0
  end

  def test_article_get_by_id
    article = Article.find('298486374');
    assert article
  end

  def test_article_get_all
    articles = Article.order('created_at DESC')
    sz = articles.length()
    assert sz > 0
  end

end
