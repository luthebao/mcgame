// Decompiled by BaoLT
// https://github.com/luthebao

//com.qeedoo.ui.view.comp.AutoComplete

package com.qeedoo.ui.view.comp
{
    import mx.controls.ComboBox;
    import flash.events.Event;
    import mx.core.UIComponent;
    import flash.events.TextEvent;
    import flash.ui.Keyboard;
    import flash.events.KeyboardEvent;
    import flash.events.FocusEvent;
    import mx.collections.ICollectionView;

    public class AutoComplete extends ComboBox 
    {

        private var isfocusInDropDown:Boolean = false;
        private var isBackSpaceKeyDown:Boolean = false;
        private var isAutoComplete:Boolean = false;
        private var isTextBoxStringChange:Boolean = false;
        private var _filterFunction:Function = myFilterFunction;

        public function AutoComplete()
        {
            init();
        }

        override protected function collectionChangeHandler(_arg_1:Event):void
        {
            super.collectionChangeHandler(_arg_1);
            if (dataProvider.length > 0)
            {
            };
        }

        public function set IsAutoComplete(_arg_1:Boolean):void
        {
            isAutoComplete = _arg_1;
        }

        public function set IsfocusInDropDown(_arg_1:Boolean):void
        {
            isfocusInDropDown = _arg_1;
        }

        override protected function commitProperties():void
        {
            var _local_1:String;
            if (isTextBoxStringChange)
            {
                prompt = text;
                filter();
                if (((isAutoComplete) && (!(isBackSpaceKeyDown))))
                {
                    _local_1 = "";
                    if (dataProvider.length > 0)
                    {
                        _local_1 = itemToLabel(dataProvider[0]);
                        textInput.setSelection(prompt.length, _local_1.length);
                        prompt = _local_1;
                    }
                    else
                    {
                        textInput.setSelection(textInput.selectionEndIndex, textInput.selectionEndIndex);
                    };
                }
                else
                {
                    textInput.setSelection(textInput.selectionEndIndex, textInput.selectionEndIndex);
                };
            };
            super.commitProperties();
            isTextBoxStringChange = false;
        }

        private function init():*
        {
            editable = true;
            rowCount = 5;
            selectedIndex = -1;
            isTextBoxStringChange = false;
            isfocusInDropDown = false;
            isAutoComplete = false;
            setStyle("cornerRadius", 0);
            setStyle("arrowButtonWidth", 0);
            setStyle("fontWeight", "normal");
            setStyle("paddingLeft", 0);
        }

        public function get FilterFunction():Function
        {
            return (_filterFunction);
        }

        override protected function measure():void
        {
            super.measure();
            measuredWidth = UIComponent.DEFAULT_MEASURED_WIDTH;
        }

        override protected function textInput_changeHandler(_arg_1:Event):void
        {
            if (textInput.text == prompt)
            {
                isTextBoxStringChange = false;
            }
            else
            {
                isTextBoxStringChange = true;
            };
            super.textInput_changeHandler(_arg_1);
            invalidateProperties();
            var _local_2:TextEvent = new TextEvent("TextChange");
            _local_2.text = _arg_1.target.text;
            dispatchEvent(_local_2);
        }

        public function set FilterFunction(_arg_1:Function):void
        {
            _filterFunction = _arg_1;
        }

        public function get IsfocusInDropDown():Boolean
        {
            return (isfocusInDropDown);
        }

        override protected function keyDownHandler(_arg_1:KeyboardEvent):void
        {
            if (((!(_arg_1.ctrlKey)) && (!(_arg_1.shiftKey))))
            {
                if (_arg_1.keyCode == Keyboard.BACKSPACE)
                {
                    close();
                    isBackSpaceKeyDown = true;
                }
                else
                {
                    if (_arg_1.keyCode == Keyboard.ENTER)
                    {
                        setSelectItem(_arg_1.target.text);
                    }
                    else
                    {
                        isBackSpaceKeyDown = false;
                    };
                };
                if (((_arg_1.keyCode == Keyboard.UP) && (selectedIndex == 0)))
                {
                    selectedIndex = -1;
                };
            };
            super.keyDownHandler(_arg_1);
        }

        override protected function focusInHandler(_arg_1:FocusEvent):void
        {
            if (((isfocusInDropDown) && (parent.visible)))
            {
                open();
            };
            super.focusInHandler(_arg_1);
        }

        private function setSelectItem(_arg_1:String):void
        {
            var _local_2:Object;
            var _local_3:KeyboardEvent;
            for each (_local_2 in dataProvider)
            {
                if (_arg_1 == _local_2.name)
                {
                    selectedItem = _local_2;
                    _local_3 = new KeyboardEvent("EnterKey");
                    dispatchEvent(_local_3);
                };
            };
        }

        public function get IsAutoComplete():Boolean
        {
            return (isAutoComplete);
        }

        private function filter():void
        {
            var _local_1:ICollectionView = (dataProvider as ICollectionView);
            _local_1.filterFunction = _filterFunction;
            _local_1.refresh();
            if (parent.visible)
            {
                open();
            };
        }

        private function myFilterFunction(_arg_1:Object):Boolean
        {
            var _local_2:String = itemToLabel(_arg_1);
            var _local_3:String = _local_2.toLowerCase();
            var _local_4:String = prompt.toLowerCase();
            if (_local_3.indexOf(_local_4) >= 0)
            {
                return (true);
            };
            return (false);
        }


    }
}//package com.qeedoo.ui.view.comp

