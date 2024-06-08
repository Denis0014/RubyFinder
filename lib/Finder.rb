class DirectoryNotExist < StandardError
end
class FileNotReadable < StandardError
end

class Reader
  @dirName = ""
  @stopList = []

  def initialize(dirName, stopList = [])
    @dirName = dirName
    @stopList = stopList
  end

  def tolist()
    result = {}
    if !File.directory?(@dirName)
      throw DirectoryNotExist
    end
    entries = Dir.entries(@dirName)
    files = entries.select { |entry| File.file?(File.join(@dirName, entry)) && File.extname(entry) == ".txt" }
    for file in files do
      if (File.readable?(File.join(@dirName, file)))
        result = result.merge(split_word(File.read(File.join(@dirName, file)))) { |key, old_value, new_value| old_value + new_value }
      else
        throw FileNotReadable
      end
    end
    result.sort_by{|_key, value| -value}.to_h
  end

  def split_word(str)
    result = {}
    stopList = @stopList
    result.default = 0
    indices = str.split(/[^a-zA-Zа-яёA-Я0-9_]+/).to_a
    for indice in indices do
      if !stopList.include?(indice)
        result[indice] += 1
      end
    end
    result
  end
end
