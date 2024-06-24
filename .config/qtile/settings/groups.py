from libqtile.config import Group


def get_groups():

    groups = []

    group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0",]

    group_labels = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十"]

#    group_layouts = ["monadtall", "matrix"]
    group_layouts = ["monadtall", "monadtall", "matrix", "bsp", "monadtall", "matrix", "monadtall", "bsp", "monadtall", "monadtall",]

    for i in range(len(group_names)):
        groups.append(
            Group(
                name=group_names[i],
                layout=group_layouts[i].lower(),
                label=group_labels[i],
            ))

    return groups



