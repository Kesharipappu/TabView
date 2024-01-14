import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    x: 0
    y: 0
    title: "Tab Navigation Example"

    property int activeTab: 0 // Track the currently active tab (0 for First, 1 for Second, 2 for Third)

    // TabBar for navigation
    TabBar {
        id: tabBar
        width: parent.width
        currentIndex: stackView.currentIndex
        anchors.top: parent.top

        TabButton {
            text: "First"
            onClicked: {
                if (activeTab !== 0) {
                    // Close Page2 and Page3 if they are not associated with the current tab
                    closePage2AndPage3();
                    activeTab = 0;

                }
                stackView.replace(page1Component.createObject(stackView));
            }
        }

        TabButton {
            text: "Second"
            onClicked: {
                if (activeTab !== 1) {
                    // Close Page1 and Page3 if they are not associated with the current tab
                    closePage1AndPage3();
                    activeTab = 1;
                }
                stackView.replace(page2Component.createObject(stackView));
            }
        }

        TabButton {
            text: "Third"
            onClicked: {
                if (activeTab !== 2) {
                    // Close Page1 and Page2 if they are not associated with the current tab
                    closePage1AndPage2();
                    activeTab = 2;
                }
                stackView.replace(page3Component.createObject(stackView));
            }
        }
    }

    // StackView to manage page navigation
    StackView {
        id: stackView
        width: parent.width
        height: parent.height - tabBar.height
        anchors.top: tabBar.bottom

        // Define a Component for each page
        Component {
            id: page1Component
            Page1 {}
        }

        Component {
            id: page2Component
            Page2 {}
        }

        Component {
            id: page3Component
            Page3 {}
        }
    }

    // Functions to close specific pages
    function closePage1AndPage2() {
        stackView.pop(page1Component.item);
        stackView.pop(page2Component.item);
    }

    function closePage1AndPage3() {
        stackView.pop(page1Component.item);
        stackView.pop(page3Component.item);
    }

    function closePage2AndPage3() {
        stackView.pop(page2Component.item);
        stackView.pop(page3Component.item);
    }
}
