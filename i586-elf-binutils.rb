require 'formula'

class I586ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz'
  sha256 'cccf377168b41a52a76f46df18feb8f7285654b3c1bd69fc8265cb0fc6902f2d'

  depends_on 'gcc' => :build
  def install
    ENV['CC'] = '/usr/local/opt/gcc/bin/gcc-5'
    ENV['CXX'] = '/usr/local/opt/gcc/bin/g++-5'
    ENV['CPP'] = '/usr/local/opt/gcc/bin/cpp-5'
    ENV['LD'] = '/usr/local/opt/gcc/bin/gcc-5'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=x86_64-elf','--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
    end
  end

end
