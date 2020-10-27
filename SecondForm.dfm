object AnotherForm: TAnotherForm
  Left = 0
  Top = 0
  Caption = 'AnotherForm'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 72
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Log An Error'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 56
    Top = 112
    Width = 705
    Height = 265
    Lines.Strings = (
      
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibu' +
        'lum volutpat cursus tortor, et laoreet metus bibendum et. Etiam ' +
        'nec dui fringilla, '
      
        'ornare erat a, mollis velit. Proin molestie ultrices arcu. Nam m' +
        'olestie euismod orci, et lacinia sem condimentum at. Fusce dolor' +
        ' enim, tristique '
      
        'interdum suscipit eu, sagittis vel tortor. Ut molestie eros laci' +
        'nia massa scelerisque lacinia. Donec eget felis sed sem euismod ' +
        'accumsan. Nullam a '
      
        'est quis nulla porttitor condimentum. Vestibulum lorem quam, por' +
        'ttitor sed erat condimentum, elementum ornare tellus. Nunc facil' +
        'isis magna quis '
      
        'ex euismod lobortis. Vestibulum nunc nisl, lobortis a urna vel, ' +
        'porta elementum lorem. Suspendisse lobortis est sagittis metus p' +
        'orta, eget '
      
        'maximus leo commodo. Nunc ultricies convallis purus eget accumsa' +
        'n.')
    TabOrder = 1
  end
end
