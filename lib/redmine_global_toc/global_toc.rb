module RedmineGlobalToc::GlobalToc

  Redmine::WikiFormatting::Macros.register do
    desc "Add global-toc macro to Wiki. Example: {{global_toc}}"
    macro :global_toc do |obj, args|
      _textile = ''
      Project.project_tree(Project.all) do |project, level = 0|
        _wiki = !project.wiki.nil? && project.wiki.visible?
        _printable = RedmineGlobalToc::GlobalToc.project_printable?(project) && (_wiki || !project.children.empty?)
        if _printable
          if _wiki && project.visible?
            _textile = _textile + "#{"*" * (level + 1)} [[#{project.identifier}:|#{project.name}]]\n"
          else
            _textile = _textile + "#{"*" * (level + 1)} #{project.name}\n"
          end
        end
      end
      content_tag(:div, textilizable(_textile, :object => obj, :headings => false), :class => 'global-toc')
    end
  end

  def project_printable?(project)
    result = project.visible?
    unless result
      project.children.each do |child|
        result = result || project_printable?(child)
      end
    end
    result
  end

  module_function :project_printable?
end