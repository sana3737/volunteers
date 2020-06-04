module ArticlesHelper
  def display_category(category)
    case category
    when "column"
      return "コラム"
    when "interview"
      return "インタビュー"
    when "news"
      return "お知らせ"
    else
      return  "その他"
    end
  end

  def display_pick_up(article)
    return content_tag(:span,'ピックアップ', class: "label label-primary") if article.pick_up
  end
end
